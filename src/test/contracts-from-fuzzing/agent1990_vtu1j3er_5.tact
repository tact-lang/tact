message(1) EmptyMsg {}

struct BigStruct {
    inner: EmptyMsg;
    count: Int;
    flag: Bool;
    note: String;
}

contract StructWithMessageField {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            inner: EmptyMsg{},
            count: 5,
            flag: true,
            note: "hi"
        };
    }
}
