struct SingleField {
    val: Int;
}

contract NestedOptField {
    s: SingleField?;

    init() {
        self.s = null;
    }
}