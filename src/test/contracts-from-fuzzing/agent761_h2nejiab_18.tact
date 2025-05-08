struct NestedDefault {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultNestedStruct {
    cmp: NestedDefault;

    init() {
        self.cmp = NestedDefault{};
    }
}
