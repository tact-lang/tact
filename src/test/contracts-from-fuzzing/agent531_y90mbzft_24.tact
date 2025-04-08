struct NullStruct {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract DefaultNulls {
    data: NullStruct;

    init() {
        self.data = NullStruct{};
    }
}