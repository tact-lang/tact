struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    i1: Inner;
    i2: Inner;
    i3: Inner;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            i1: Inner{x: 1, y: null},
            i2: Inner{x: 2, y: true},
            i3: Inner{x: 3, y: false}
        };
    }
}