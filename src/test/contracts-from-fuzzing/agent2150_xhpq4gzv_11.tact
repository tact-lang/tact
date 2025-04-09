struct NestedOptionals {
    a: Int?;
    b: InnerNest?;
}

struct InnerNest {
    c: Bool?;
    d: String?;
    e: DeepInner?;
}

struct DeepInner {
    f: Int?;
    g: Bool?;
}

contract TestContract {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            a: null,
            b: InnerNest{
                c: null,
                d: null,
                e: DeepInner{
                    f: null,
                    g: null
                }
            }
        };
    }
}