struct Inner1 { f: Int }
struct Inner2 { g: Bool }
struct Middle1 { in1: Inner1 }
struct Middle2 { in2: Inner2 }
struct Outer {
    mid1: Middle1;
    mid2: Middle2;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            mid1: Middle1{ in1: Inner1{ f: 42 } },
            mid2: Middle2{ in2: Inner2{ g: true } }
        };
    }
}