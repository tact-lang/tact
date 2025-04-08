struct Middle {
    m1: Int;
}

struct Container {
    c1: Middle;
    c2: Middle;
}

contract TwoDeep {
    d: Container;
    init() {
        self.d = Container{
            c1: Middle{m1:1},
            c2: Middle{m1:2}
        };
    }
    receive() {
        self.d.c2.m1 += 1;
    }
}