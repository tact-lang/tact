struct Inner {
    a: Int;
}

struct Outer {
    inr: Inner;
}

contract DeepAssign {
    o: Outer;

    init() {
        self.o = Outer{inr: Inner{a: 5}};
        self.o = Outer{inr: Inner{a: 42}};
    }
}