struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract NestedMix {
    data: Outer;

    init() {
        self.data = Outer{ i1: Inner1{a:1}, i2: Inner2{b:true} };
    }
}