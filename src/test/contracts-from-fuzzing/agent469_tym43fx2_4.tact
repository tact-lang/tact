struct Inner {
    val: Int;
}

contract OptionalNested {
    field: Inner?;

    init() {
        self.field = Inner{
            val: 123
        };
    }
}