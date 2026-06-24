struct MixedSerializers {
    x: Int as uint32;
    y: Int;
    z: Int as int16;
    w: Bool;
}

contract MixedSerializerContract {
    stored: MixedSerializers;

    init() {
        self.stored = MixedSerializers{
            x: 4294967295,
            y: -123456789,
            z: -32768,
            w: true,
        };
    }
}