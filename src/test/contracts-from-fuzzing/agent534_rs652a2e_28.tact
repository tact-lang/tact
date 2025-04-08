struct WithBoolean {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolFieldsContract {
    flags: WithBoolean;

    init() {
        self.flags = WithBoolean{
            a: true,
            b: false,
            c: true,
        };
    }
}