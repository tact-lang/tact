struct IntBoolStringOpt {
    x: Int;
    y: Bool;
    z: String?;
}

contract TestIntBoolStringOpt {
    val: IntBoolStringOpt;

    init() {
        self.val = IntBoolStringOpt {
            x: 7,
            y: true,
            z: null,
        };
    }
}