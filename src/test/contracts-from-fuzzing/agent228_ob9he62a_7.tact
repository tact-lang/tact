message(42) MsgOpt {
    x: Int;
}

contract TestContract {
    foo: MsgOpt?;

    init() {
        self.foo = null;
    }
}