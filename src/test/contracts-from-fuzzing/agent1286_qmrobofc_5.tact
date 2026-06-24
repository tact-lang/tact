struct Inner {
    x: Int as uint8;
    y: Int as int16;
    z: Bool;
}

contract SerializedNested {
    s: Inner;

    init() {
        self.s = Inner{ x: 255, y: -200, z: true };
    }
}