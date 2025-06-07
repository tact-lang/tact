struct SelfRef {
    val: Int;
}

contract SelfField {
    s: SelfRef? = null;

    init() {
        self.s = null;
    }
}
