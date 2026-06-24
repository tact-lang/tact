message(123) Note { val: Int; }

contract MessageField {
    m: Note;

    init() {
        self.m = Note{ val: 99 };
    }
}