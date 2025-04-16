struct InnerS {
    flag: Bool;
}

struct OuterS {
    nested1: InnerS;
    nested2: InnerS;
    optNested: InnerS?;
}

contract MultipleNestedStructs {
    data: OuterS;

    init() {
        self.data = OuterS{
            nested1: InnerS{flag:true},
            nested2: InnerS{flag:false},
            optNested: null
        };
    }
}