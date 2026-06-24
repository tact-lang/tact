struct OptionalTop {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptionalTopVars {
    s: OptionalTop;

    init() {
        self.s = OptionalTop { x: null, y: null, z: null };
    }
}