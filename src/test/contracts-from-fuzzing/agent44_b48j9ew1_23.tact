struct OptNested {
    val: Int;
    optStr: String?;
}

contract OptionalNest {
    data: OptNested?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = OptNested{ val: 8, optStr: null };
    }
}