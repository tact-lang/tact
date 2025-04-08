struct InnerS {
    value: Int;
}

struct OuterS {
    nested1: InnerS;
    nested2: InnerS;
    nested3: InnerS;
}

contract WideNestedContract {
    storage: OuterS;

    init() {
        self.storage = OuterS{
            nested1: InnerS{value:1},
            nested2: InnerS{value:2},
            nested3: InnerS{value:3}
        };
    }
}