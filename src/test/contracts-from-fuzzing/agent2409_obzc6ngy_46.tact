struct Tiny {
    x: Int as int4;
    y: Int as uint3;
}

contract SerializedTinyInts {
    s: Tiny;

    init() {
        self.s = Tiny{ x: 3, y: 4 };
    }
}