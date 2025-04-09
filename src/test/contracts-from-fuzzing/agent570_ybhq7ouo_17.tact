struct Note {
    text: String;
}

contract BigStringInitTest {
    note: Note;

    init() {
        self.note = Note{
            text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        };
    }

    receive() {}
}