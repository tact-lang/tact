struct S {
    a: Int?;
    b: Int;
    c: Int?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: null,
            b: 1,
            c: null
        };
    }
}
