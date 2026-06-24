struct InnerMost { val: Int }
struct Middle1 { inner: InnerMost }
struct Middle2 { inner: InnerMost }
struct Outer {
    mid1: Middle1;
    mid2: Middle2;
    flag: Bool;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            mid1: Middle1{ inner: InnerMost{ val: 5 } },
            mid2: Middle2{ inner: InnerMost{ val: 10 } },
            flag: false
        };
    }
}