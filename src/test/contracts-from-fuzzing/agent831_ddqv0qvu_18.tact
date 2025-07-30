struct WithSerialization {
    x: Int as uint4;
    y: Int as int7;
    z: Int as uint33;
}

contract Test {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            x: 5,
            y: -10,
            z: 1234567
        };
    }
}