struct NestedInner {
    a: Int;
    b: Int?;
}

struct Outer {
    s1: NestedInner;
    s2: NestedInner;
}

contract TestContract {
    myData: Outer;
    init() {
        self.myData = Outer{
            s1: NestedInner{
                a: 1,
                b: 2,
            },
            s2: NestedInner{
                a: 3,
                b: null,
            }
        };
    }
}
