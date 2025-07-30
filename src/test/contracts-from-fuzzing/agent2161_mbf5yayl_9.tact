// Empty struct field is forbidden, test contract with only a single primitive field and 0 defaults
contract SinglePrimitive {
    val: Int;

    init() {
        self.val = 123;
    }
}