struct Inner1 { i: Int }
struct Inner2 { b: Bool }

struct Outer {
    s1: Inner1;
    s2: Inner2;
}

contract Complex {
    o: Outer;

    init() {
        self.o = Outer{
            s1: Inner1{ i: 5 },
            s2: Inner2{ b: true },
        };
    }
}