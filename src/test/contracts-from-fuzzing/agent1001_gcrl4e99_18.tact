struct StructA {
    val: Int as uint8;
}

struct StructB {
    first: StructA;
    second: Int;
}

struct StructC {
    inner: StructB;
    extra: Bool;
}

contract TinyInts {
    data: StructC;

    init() {
        self.data = StructC{
            inner: StructB{
                first: StructA{ val: 255 },
                second: 1000
            },
            extra: true
        };
    }
}