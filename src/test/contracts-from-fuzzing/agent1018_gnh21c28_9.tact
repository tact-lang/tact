struct NestedOptional {
    val: Int?;
}

contract TestOptNullable {
    maybe: NestedOptional?;

    init() {
        self.maybe = null;
    }
}