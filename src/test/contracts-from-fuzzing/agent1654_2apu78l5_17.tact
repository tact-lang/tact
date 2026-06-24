struct NestedOptional {
    val: Int?;
}

contract TestContract {
    foo: NestedOptional?;
    init() {
        self.foo = null;
    }
}