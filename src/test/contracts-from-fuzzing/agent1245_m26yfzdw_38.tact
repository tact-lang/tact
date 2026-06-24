struct SOne {
    val: Int;
}

contract OptionalInit {
    s: SOne?;

    init() {
        self.s = null;
    }
}
