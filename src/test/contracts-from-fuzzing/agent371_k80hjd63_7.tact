struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

struct Outer {
    nested: NestedOptionals;
}

contract TestContract {
    myData: Outer;

    init() {
        self.myData = Outer{
            nested: NestedOptionals{
                a:null, b:null, c:null, d:null, e:null, f:null
            }
        };
    }
}
