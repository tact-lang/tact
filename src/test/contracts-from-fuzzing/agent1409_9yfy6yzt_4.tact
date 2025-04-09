struct InnerMost {
    value: Int;
}

struct Middle {
    innerMost: InnerMost;
}

struct OuterMost {
    flag: Bool;
    middle: Middle;
}

contract TestContract {
    deepNested: OuterMost;
    
    init() {
        self.deepNested = OuterMost{
            flag: true,
            middle: Middle{
                innerMost: InnerMost{ value: 7 }
            }
        };
    }
}
