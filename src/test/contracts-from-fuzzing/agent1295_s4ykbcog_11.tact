// optional message struct used as persistent var
message(1) MsgTest {
    foo: Int;
    bar: Bool;
}

contract ContractTest {
    v: MsgTest?;

    init() {
        self.v = MsgTest{
            foo: 42,
            bar: true
        };
    }
}