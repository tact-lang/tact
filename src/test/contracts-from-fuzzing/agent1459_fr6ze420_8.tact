// Struct with mixed serialization formats
struct MixedSerialization {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
    flag: Bool;
    text: String;
}

contract SerializeTest {
    val: MixedSerialization;

    init() {
        self.val = MixedSerialization{
            x: 255,
            y: -32768,
            z: 4294967295,
            flag: true,
            text: "serialization"
        };
    }
}