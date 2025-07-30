struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract Test {
    x: NestedOpt;

    init() {
        self.x = NestedOpt{a: null, b: null};
    }
}
