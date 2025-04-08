struct S {
    v: Int;
    s: String?;
}

contract OptionalStructFieldInit {
    val: S? = null;

    init() {
        self.val = null;
    }
}
