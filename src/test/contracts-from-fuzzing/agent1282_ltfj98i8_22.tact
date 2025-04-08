// Test serialization options combined with optional fields
struct OptSerialize {
    a: Int? as uint8;
    b: Bool?;
    c: Int as int64;
}

contract OptSer {
    content: OptSerialize;

    init() {
        self.content = OptSerialize{
            a: null,
            b: null,
            c: 42
        };
    }
}