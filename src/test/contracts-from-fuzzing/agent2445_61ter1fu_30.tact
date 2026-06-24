struct S {
    b: Builder;
}

contract C {
    s: S;

    init() {
        self.s = S{
            b: beginCell(),
        };
    }

    receive() {}
}