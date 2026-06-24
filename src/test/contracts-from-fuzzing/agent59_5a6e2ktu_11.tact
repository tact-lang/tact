struct NestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    x: NestedOptional?;

    init() {
        self.x = null;
    }
}