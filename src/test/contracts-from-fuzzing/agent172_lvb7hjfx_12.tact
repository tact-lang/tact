struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Bool?;
}

struct Container {
    nested: NestedOptionals;
}

contract Test {
    cont: Container;

    init() {
        self.cont = Container{
            nested: NestedOptionals{
                a:null, b:null, c:null, d:null, e:null, f:null
            }
        };
    }
}