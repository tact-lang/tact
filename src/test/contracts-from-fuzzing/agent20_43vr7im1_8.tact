struct InnerDefault {
    X: Int = 100;
}

struct OuterDefault {
    I: InnerDefault;
    Y: Int = 200;
}

contract TestDefaults {
    receive() {
        // Instantiate OuterDefault without explicitly providing default fields
        let o: OuterDefault = OuterDefault { I: InnerDefault {} };
        // Compute sum of default values
        o.I.X + o.Y;
    }
}
