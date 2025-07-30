// Check serialization specifiers with optionals
struct SerialOpts {
    x: Int as int64;
    y: Int?;
    z: Int as uint32;
}

contract MixedSerializationOpt {
    s: SerialOpts;

    init() {
        self.s = SerialOpts{ x: -1, y: null, z: 42 };
    }
}
