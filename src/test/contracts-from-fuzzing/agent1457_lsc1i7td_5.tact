struct Inner1 {
    x1: Int;
}

struct Inner2 {
    x2: Int;
}

contract MultipleNested {
    f1: Inner1;
    f2: Inner2;

    init() {
        self.f1 = Inner1{x1: 1};
        self.f2 = Inner2{x2: 2};
    }
}
