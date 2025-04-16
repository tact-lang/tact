struct Nested1 {
    innerInt: Int;
    innerOptStr: String?;
}

struct Nested2 {
    nested: Nested1;
    optInner: Nested1?;
}

struct Nested3 {
    n2: Nested2;
    optN2: Nested2?;
}

contract DeepOptionalNest {
    d: Nested3;

    init() {
        self.d = Nested3{
            n2: Nested2{
                nested: Nested1{innerInt:1, innerOptStr:null},
                optInner: null,
            },
            optN2: null,
        };
    }
}