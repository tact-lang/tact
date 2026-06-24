struct DoubleInner {
    a: Int;
    b: String;
}

struct OuterMost {
    x: DoubleInner;
    y: DoubleInner;
}

contract DualStruct {
    outer: OuterMost;

    init() {
        self.outer = OuterMost{
            x: DoubleInner{a:1,b:"x"},
            y: DoubleInner{a:2,b:"y"},
        };
    }
}