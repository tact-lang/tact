struct Mid {
    foo: Int;
    bar: Bool;
}

contract OptionalStruct {
    opt: Mid?;

    init() {
        self.opt = null;
    }

    receive() {
        self.opt = Mid{foo: 3, bar: true};
    }
}
