struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Builder?;
    f6: Slice?;
    f7: String?;
}

contract ContractWithOptionalStruct {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
            f7: null,
        };
    }
}