struct WithDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String;
}

contract StructDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{
            z: "supplied",
            // x,y omitted; use struct defaults
        };
    }

    receive() {}
}