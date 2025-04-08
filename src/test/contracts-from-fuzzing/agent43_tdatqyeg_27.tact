struct IntsSerialized {
    a: Int as int1;
    b: Int as int8;
    c: Int as uint1;
    d: Int as uint8;
}

contract TinySerialization {
    x: IntsSerialized;

    init() {
        self.x = IntsSerialized{ a:1, b:2, c:1, d:2 };
    }
}