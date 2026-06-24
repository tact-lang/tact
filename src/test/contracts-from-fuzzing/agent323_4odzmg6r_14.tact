message(7) Note {
    text: String;
    urgent: Bool;
}

contract Test {
    savedNote: Note?;

    init() {
        self.savedNote = null;
    }
}