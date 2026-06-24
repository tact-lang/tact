struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Container {
    i1: Inner1;
    i2: Inner2;
}

contract TwoDiffInner {
    s: Container;
    init() {
        self.s = Container{
            i1: Inner1{a: 5},
            i2: Inner2{b: 7}
        };
    }
}