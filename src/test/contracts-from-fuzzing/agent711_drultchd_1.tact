struct NestedOptional {
    val1: Int?;
    val2: Bool?;
    str: String?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            val1: null,
            val2: true,
            str: "hello",
        };
    }
}