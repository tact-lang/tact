message(0xabcdefff) SomeMsg {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    data: SomeMsg;

    init() {
        self.data = SomeMsg{foo: 7, bar: null};
    }
}