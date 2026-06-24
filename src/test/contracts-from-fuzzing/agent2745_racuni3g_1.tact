struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract TestNestedOpt {
    n1: NestedOpt;

    init() {
        self.n1 = NestedOpt{
            a: null,
            b: true,
        };
    }
}