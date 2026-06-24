struct MixSerialOptions {
    a: Int as uint8;
    b: Bool = true;
    c: Int?;
    d: Bool? = null;
    e: String? = null;
}

contract MixSerialTest {
    val: MixSerialOptions;

    init() {
        self.val = MixSerialOptions{
            a: 8,
            c: null
        };
    }
}