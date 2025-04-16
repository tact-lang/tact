struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract Test5 {
    x: Int?;
    y: NestedOptional?;

    init() {
        self.x = null;
        self.y = null;
    }
}
