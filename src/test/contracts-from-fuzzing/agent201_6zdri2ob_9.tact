struct AllOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
    f6: Slice?;
    f7: Builder?;
}

contract OptionalEverything {
    data: AllOptional;

    init() {
        self.data = AllOptional{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
            f7: null
        };
    }
}
