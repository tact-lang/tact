struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int;
}
struct Inner3 {
    c: Int;
}

struct Outer {
    inner1: Inner1;
    inner2: Inner2;
    inner3: Inner3;
}

contract MultiInnerStructs {
    data: Outer;
    init() {
        self.data = Outer{
            inner1: Inner1{a: 1},
            inner2: Inner2{b: 2},
            inner3: Inner3{c: 3}
        };
    }
}