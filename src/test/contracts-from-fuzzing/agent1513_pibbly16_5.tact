struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

contract OptionNest {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}