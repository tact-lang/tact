struct Tiny {
    x: Int as uint4;
    y: Int as uint3;
    z: Int as uint2;
}

contract TinyStorage {
    t: Tiny;

    init() {
        self.t = Tiny {
            x: 7,
            y: 3,
            z: 1,
        };
    }
}
