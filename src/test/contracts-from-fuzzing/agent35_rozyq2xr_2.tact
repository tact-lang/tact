struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNesting {
    some: NestedOpt?;
    init() {
        self.some = null;
    }
}