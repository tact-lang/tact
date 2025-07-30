struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{ x: null, y: true };
    }
}