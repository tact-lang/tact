struct S {
    a: Int;
    b: Bool?;
    c: Address?;
}

contract Test {
    state: S;

    init() {
        self.state = S{
            a: 5,
            b: null,
            c: null,
        };
    }
}
