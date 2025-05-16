message(0x42) Note {
    content: String;
    id: Int as uint32;
}

contract PersistentMessageStruct {
    noteData: Note;

    init() {
        self.noteData = Note{
            content: "Hello", id: 777
        };
    }
}