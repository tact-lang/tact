struct Tiny { x: Int; y: Int; }

contract TinyNested {
    p: Tiny;
    q: Tiny;
    r: Tiny;

    init() {
        self.p = Tiny{x:1,y:2};
        self.q = Tiny{x:2,y:3};
        self.r = Tiny{x:3,y:4};
    }
}