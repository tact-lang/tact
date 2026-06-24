struct Mid {
    i: Int;
    s: String?;
}

contract NullableStructInsideContract {
    val: Mid?;
    init() {
        self.val = null;
    }
}