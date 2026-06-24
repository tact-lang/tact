struct ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct WrapComplexOpt {
    one: ComplexOptionals;
    two: ComplexOptionals;
}

contract ManyNestedOptionals {
    field: WrapComplexOpt;

    init() {
        self.field = WrapComplexOpt{
            one: ComplexOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null
            },
            two: ComplexOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null
            }
        };
    }
}