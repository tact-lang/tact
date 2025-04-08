struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional {
            val: null,
            flag: true,
        };
    }
}