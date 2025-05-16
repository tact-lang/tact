struct S {
    x: Int as uint8;
    y: Int? as uint8;
}

contract OptionalWithSerialization {
    s: S;

    init() {
        self.s = S { x: 255, y: null };
    }
}