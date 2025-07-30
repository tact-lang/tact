struct NestedOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct OuterOpt {
    nested: NestedOptionals?;
}

contract MultiOptStruct {
    outer: OuterOpt?;

    init() {
        self.outer = OuterOpt{
            nested: NestedOptionals{
                a:1,b:null,c:42
            }
        };
    }
}