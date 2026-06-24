struct BigOptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract BigOptionalStorage {
    data: BigOptionalStruct?;

    init() {
        self.data = null;
    }
}