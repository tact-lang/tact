struct A {
    a1: Int;
    a2: Bool;
}

contract OptionalDeep {
    opt: A? = null;

    init() {
        self.opt = A{
            a1: 12,
            a2: true
        };
    }
}