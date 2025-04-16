// Combine nested optionals with serialization constraints
struct S {
    x: Int? as uint8;
    y: Int? as int32;
}

contract OptSerialize {
    s: S;

    init() {
        self.s = S{ x: 42, y: null };
    }
}