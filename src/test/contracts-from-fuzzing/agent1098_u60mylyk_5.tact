struct Inner {
    inner_field: Int;
}

contract OptionalNested {
    nested_opt: Inner?;
    bool_field: Bool;

    init() {
        self.nested_opt = null;
        self.bool_field = true;
    }
}
