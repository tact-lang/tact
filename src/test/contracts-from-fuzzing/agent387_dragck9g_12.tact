struct NestedOptOptional {
    val1: Int?;
    val2: Bool?;
}

contract OptFields {
    field: NestedOptOptional;
    init() {
        self.field = NestedOptOptional{
            val1: null, val2: null
        };
    }
}
