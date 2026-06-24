struct WithSerialization {
    x: Int as uint8;    // 0..255
    y: Int as int16;   // -32768..32767
    z: Int as uint4;   // 0..15
    b: Bool;           
}

contract TestContract {
    s: WithSerialization;
    init() {
        self.s = WithSerialization{
            x: 42, y: -123, z: 7, b: true
        };
    }
}
