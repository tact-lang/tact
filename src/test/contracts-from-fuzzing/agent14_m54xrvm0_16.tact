message(123) MsgTest {
    foo: Int;
    bar: String;
}

contract Test16 {
    stored: MsgTest;

    init() {
        self.stored = MsgTest{foo: 7, bar: "hello"};
    }
}
