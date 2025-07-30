// Contract using nested struct with optional primitive with serialization annot
struct Inner {
    val: Int? as uint8;
}

struct Outer {
    inner: Inner;
}

contract OptionalSerializedField {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ val: null } };
    }
}
