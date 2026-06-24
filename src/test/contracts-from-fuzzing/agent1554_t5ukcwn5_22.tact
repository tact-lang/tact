struct NestedStructOpt {
    foo: Int;
    bar: Bool;
}

contract OptionalNested {
    val: NestedStructOpt?;

    init() {
        self.val = null;
    }
}