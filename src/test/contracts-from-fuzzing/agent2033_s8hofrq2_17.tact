struct SerializeNest {
    x: Int as int64;
    y: Bool;
    z: String;
}

contract Test {
    nested: SerializeNest;

    init() {
        self.nested = SerializeNest{
            x: 9876543210,
            y: true,
            z: "serialize"
        };
    }
}