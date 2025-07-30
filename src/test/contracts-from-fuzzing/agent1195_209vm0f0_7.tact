struct NestedDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "xyz";
    d: Int?;
}

contract DefaultStructHolder {
    field: NestedDefault;

    init() {
        self.field = NestedDefault{};
    }
}
