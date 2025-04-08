struct Tiny {
    x: Int as int8;
    y: Int as uint4;
}

contract BitSizeOverride {
    t: Tiny;

    init() {
        self.t = Tiny{x: 7, y: 10};
    }
}