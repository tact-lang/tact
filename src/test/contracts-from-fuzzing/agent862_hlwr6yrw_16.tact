struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract ManyNestedParallel {
    o: Outer;

    init() {
        self.o = Outer{
            i1: Inner1{ x: 5 },
            i2: Inner2{ y: 7 }
        };
    }
}
