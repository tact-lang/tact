struct S {
    a: Int? as uint32;
}

contract OptSized {
    s: S;

    init() {
        self.s = S{
            a: null,
        };
    }
}