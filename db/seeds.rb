# db/seeds.rb

require 'json'

json_data = '{
  "results": 
  [
    {
    "room":{
      "name": "Product A",
      "id": 12456,
      "image_url": "https://picsum.photos/id/237/200/300",
      "participant": [
          {
            "id": "admin@mail.com",
            "name": "Admin",
            "role": 0
          },
          {
            "id": "agent@mail.com",
            "name": "Agent A",
            "role": 1
          },
          {
            "id": "customer@mail.com",
            "name": "king customer",
            "role": 2
          }
        ]
    }, 
    "comments": [
      {
        "id": 885512,
        "type": "text",
        "message": "Selamat malam",
        "sender": "customer@mail.com"
      },
      {
        "id": 885513,
        "type": "text",
        "message": "Malam",
        "sender": "agent@mail.com"
      },
      {
        "id": 885514,
        "type": "text",
        "message": "Ada yang bisa saya bantu?",
        "sender": "agent@mail.com"
      },
      {
        "id": 885515,
        "type": "text",
        "message": "Saya ingin mengirimkan bukti pembayaran, karena diaplikasi selalu gagal",
        "sender": "customer@mail.com"
      },
      {
        "id": 885516,
        "type": "text",
        "message": "Baik, silahkan kirimkan lampiran bukti pembayarannya",
        "sender": "agent@mail.com"
      }
    ]
  }
  ]
}'

data = JSON.parse(json_data)

# Create users
users = {}
data['results'].first['room']['participant'].each do |participant|
  user = User.find_or_create_by(username: participant['id']) do |u|
    u.created_at = Time.now
    u.updated_at = Time.now
  end
  users[participant['id']] = user
end

# Create room
room_data = data['results'].first['room']
room = Room.find_or_create_by(name: room_data['name']) do |r|
  r.created_at = Time.now
  r.updated_at = Time.now
end

# Create participants
room_data['participant'].each do |participant|
  Participant.find_or_create_by(user: users[participant['id']], room: room) do |p|
    p.created_at = Time.now
    p.updated_at = Time.now
  end
end

# Create messages
data['results'].first['comments'].each do |comment|
  user = users[comment['sender']]
  Message.create!(
    user: user,
    room: room,
    content: comment['message'],
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "Database seeded successfully!"
