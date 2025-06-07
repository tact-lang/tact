struct SerializeNested {
    a: Int as uint8;
    b: Bool;
}

contract NestedSerialization {
    sn: SerializeNested;

    init() {
        self.sn = SerializeNested{ a: 42, b: true };
    }
}