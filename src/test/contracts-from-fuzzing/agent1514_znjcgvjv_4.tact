contract OptionalStructFields {
    s: StructTest?;

    init() {
        self.s = null;
    }
}

struct StructTest {
    x: Int;
    y: Bool;
}