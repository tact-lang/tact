struct MixedSerialization {
    x: Int;
    y: Int as uint8;
    z: Int as int16;
    b: Bool;
    s: String;
}

contract TestContract {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            x: -123456789,
            y: 255,
            z: -32768,
            b: true,
            s: "serialize"
        };
    }
}