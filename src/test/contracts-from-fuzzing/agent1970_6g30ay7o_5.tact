struct NestedOpt {
    val: Int?;
}

contract OptionalField {
    data: NestedOpt?;

    init() {
        self.data = NestedOpt{
            val: 42
        };
    }
}