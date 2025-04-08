struct BigOptionalStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
    f6: Slice?;
}

contract BigOptionalStorage {
    bs: BigOptionalStruct;

    init() {
        self.bs = BigOptionalStruct{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
        };
    }
}