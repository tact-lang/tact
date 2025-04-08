struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Outer {
    in1: Inner1;
    in2: Inner2;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            in1: Inner1{ a: 1 },
            in2: Inner2{ b: 2 }
        };
    }
}