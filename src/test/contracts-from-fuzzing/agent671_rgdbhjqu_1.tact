struct NestedOptional {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
}

contract TestNestedOptionals {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}