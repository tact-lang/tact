contract OnlyOptionalStruct {
    s: OptionalTest?;

    init() {
        self.s = null;
    }
}

struct OptionalTest {
    a: Int;
    b: Bool;
    c: String;
}