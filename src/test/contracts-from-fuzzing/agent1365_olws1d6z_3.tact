struct NestedOpt {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract NestedOptionals {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}