struct One {
 x: Int;
}

struct Two {
 y: Int;
}

struct Three {
 z: Int;
}

struct Four {
 f: Int;
}

struct Container {
    o: One;
    t: Two;
    th: Three;
    fo: Four;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            o: One{x:1},
            t: Two{y:2},
            th: Three{z:3},
            fo: Four{f:4}
        };
    }
}