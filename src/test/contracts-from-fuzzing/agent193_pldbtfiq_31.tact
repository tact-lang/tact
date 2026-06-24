struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

contract ParallelNesting {
    i1: Inner1;
    i2: Inner2;

    init() {
        self.i1 = Inner1{a:42};
        self.i2 = Inner2{b:true};
    }
}