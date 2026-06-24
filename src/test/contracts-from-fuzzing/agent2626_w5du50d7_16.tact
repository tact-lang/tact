struct InnerOpt {
    a: Int?;
    b: Int?;
}

struct OuterOpt {
    c: InnerOpt;
    d: InnerOpt;
}

contract LargeNestedOptionals {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            c: InnerOpt{a:null,b:null},
            d: InnerOpt{a:1,b:2}
        };
    }
}