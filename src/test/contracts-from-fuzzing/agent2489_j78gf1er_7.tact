struct WithSerialization {
    x: Int as uint8;
    y: Int as int16;
    z: Int as coins;
}

contract TestContract {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            x: 1,
            y: -10,
            z: ton("0.01")
        };
    }
}
