struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    amount: Int?;
}

contract OptNestedContract {
    stateData: OptionalNested;
    
    init() {
        self.stateData = OptionalNested {
            innerOpt: Inner {
                flag: true,
                amount: null,
            }
        };
    }
}