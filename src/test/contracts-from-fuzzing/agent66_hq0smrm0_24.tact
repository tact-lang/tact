struct OptSerialized {
    a: Int? as uint12;
    b: Int as uint8;
}

contract Test {
    data: OptSerialized;
    init() {
        self.data = OptSerialized{
            a: 100,
            b: 255,
        };
    }
}
