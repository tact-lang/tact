message(99) NoteMsg {
    text: String;
}

struct Holder {
    name: String;
    note: NoteMsg?;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            name: "abc",
            note: null,
        };
    }
}