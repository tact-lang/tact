// Nested struct inside optional struct field
struct SInner {
    x: Int;
}

struct SOuter {
    inner: SInner;
}

contract OptionalStruct {
    s: SOuter?;

    init() {
        self.s = SOuter { inner: SInner { x: 7 } };
    }

    receive() {}
}