struct S {
    a: Int;
    b: Bool?;
}

contract StructMixedOpt {
    data: S;

    init() {
        self.data = S {
            a: 5,
            b: null
        };
    }
}
