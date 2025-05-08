struct NestedFlag {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
}

contract TestContract {
    flags: NestedFlag;

    init() {
        self.flags = NestedFlag{
            f1: true,
            f2: null,
            f3: false,
        };
    }

    receive() {
        let _ = self.flags.f2;
    }
}