struct NestedStringOpt {
    data: String?;
}

struct ContainsNested {
    info: NestedStringOpt;
    flag: Bool;
    amount: Int?;
}

contract TestContract {
    rec: ContainsNested;
    init() {
        self.rec = ContainsNested{
            info: NestedStringOpt{
                data: null,
            },
            flag: true,
            amount: null,
        };
    }
}