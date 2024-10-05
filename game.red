Red [
    Title: "Dungeon Escape"
    Author: "Your Name"
    Version: 1.0
]

; Global variables
key-found: false
room: 1

; Function to display the current room
display-room: func [room] [
    switch room [
        1 [print "You are in Room 1. There's a door to the north."]
        2 [print "You are in Room 2. You see a shiny key on the floor."]
        3 [print "You are in Room 3. There's a door to the south."]
        4 [print "Congratulations! You found the exit!"]
    ]
]

; Function to handle player input
handle-input: func [input] [
    switch input [
        "look" [
            display-room room
        ]
        "go north" [
            if room = 1 [
                room: 2
                print "You move to Room 2."
            ] else [
                print "You can't go that way."
            ]
        ]
        "go south" [
            if room = 3 [
                room: 2
                print "You move to Room 1."
            ] else [
                print "You can't go that way."
            ]
        ]
        "take key" [
            if room = 2 [
                key-found: true
                print "You picked up the key!"
            ] else [
                print "There's no key here."
            ]
        ]
        "unlock door" [
            if key-found [
                print "You unlocked the door and escaped the dungeon!"
                room: 4
            ] else [
                print "You need a key to unlock this door."
            ]
        ]
        "quit" [
            print "Thanks for playing!"
            quit
        ]
        default [print "Invalid command."]
    ]
]

; Game loop
print "Welcome to Dungeon Escape!"
while [true] [
    display-room room
    print "What would you like to do? (look, go north, go south, take key, unlock door, quit)"
    input: to-string input
    handle-input input
    if room = 4 [break] ; End the game if the player escapes
]

print "Game Over."
