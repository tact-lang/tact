message(1010) Note {
    content: String;
}

contract TestContract {
    note: Note? = null;

    init() {
        self.note = Note{content: "hello world"};
    }
}