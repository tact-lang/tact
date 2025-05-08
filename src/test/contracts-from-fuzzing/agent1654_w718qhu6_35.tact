struct NestedOptDefault {
    a: Int = 1;
    b: Int? = null;
}

contract NestOptDefault {
    x: NestedOptDefault;

    init() {
        self.x = NestedOptDefault{};
    }
}