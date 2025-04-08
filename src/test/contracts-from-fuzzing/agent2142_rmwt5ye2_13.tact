struct SNullDef {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: Bool?;
}

contract OptionalDefaults {
    data: SNullDef;

    init() {
        self.data = SNullDef{};
    }
}
