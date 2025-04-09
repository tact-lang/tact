struct Tiny {
    x: Bool;
    y: Int as int8;
    z: Int as uint4;
}

contract TinyTypes {
    t: Tiny;

    init() {
        self.t = Tiny{
            x: true,
            y: -7,
            z: 12
        };
    }
}