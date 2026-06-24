// Contract testing serialization overlays
struct SerFields {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint32;
}

contract SerializeOverlay {
    s: SerFields;

    init() {
        self.s = SerFields{ a:1, b:1, c:1, d:1 };
    }
}