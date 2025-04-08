struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Inner3 {
    c: Int;
}

contract TestContract {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    init() {
        self.i1 = Inner1{a: 1};
        self.i2 = Inner2{b: 2};
        self.i3 = Inner3{c: 3};
    }
}