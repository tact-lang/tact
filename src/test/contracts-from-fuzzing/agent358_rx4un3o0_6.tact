struct SubInner {
    f1: Int = 1;
}

struct SubOuter {
    subA: SubInner;
    subB: SubInner;
}

struct OuterMost {
    innerStruct: SubOuter;
    number: Int = 0;
}

contract MultiNestedArrays {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            innerStruct: SubOuter{
                subA: SubInner{f1: 10},
                subB: SubInner{f1: 20}
            },
            number: 42
        };
    }
}
