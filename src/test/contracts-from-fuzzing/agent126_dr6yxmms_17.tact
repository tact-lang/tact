struct SType {
    val: Int;
}

contract OptionalStructNull {
    s: SType?;

    init() {
        self.s = null;
    }
}