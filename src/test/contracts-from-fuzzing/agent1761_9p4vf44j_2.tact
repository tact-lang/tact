struct OptionalNested {
    innerOpt: InnerOptStruct?;
}

struct InnerOptStruct {
    flag: Bool;
    amount: Int?;
}

contract TestContract {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            innerOpt: InnerOptStruct{
                flag: true,
                amount: null
            }
        };
    }
}