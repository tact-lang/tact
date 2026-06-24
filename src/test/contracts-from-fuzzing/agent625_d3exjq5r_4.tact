struct Deep3 {
    v: Bool;
}

struct Deep2 {
    w: Deep3;
}

struct Deep1 {
    z: Deep2;
}

contract Nest {
    s: Deep1;

    init() {
        self.s = Deep1 {
            z: Deep2 {
                w: Deep3 { v: true }
            }
        };
    }
}