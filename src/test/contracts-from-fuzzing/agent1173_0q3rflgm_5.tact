struct Sub {
    x: Int?;
    y: Bool;
}

struct NestedOpt {
    sub: Sub?;
    flag: Bool;
}

contract Test {
    f: NestedOpt;

    init() {
        self.f = NestedOpt {
            sub: null,
            flag: true,
        };
    }
}
