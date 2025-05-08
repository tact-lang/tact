contract HugeOptionalStruct {
    data: BigStruct;

    init() {
        self.data = BigStruct{};
    }
}

struct BigStruct {
    f1: Int?;
    f2: Bool?;
    f3: Int?;
    f4: Bool?;
    f5: Address?;
    f6: String?;
    f7: Slice?;
    f8: Cell?;
    f9: Builder?;
    f10: Address?;
}