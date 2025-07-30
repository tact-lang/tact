struct OptionalsAndNested {
    val1: Int?;
    val2: Int?;
    nested: NestedOptional;
}

struct NestedOptional {
    val3: Int?;
    val4: Int;
}

contract TestContract {
    complex: OptionalsAndNested;

    init() {
        self.complex = OptionalsAndNested{
            val1: null,
            val2: 42,
            nested: NestedOptional{
                val3: null,
                val4: 7
            }
        };
    }
}
