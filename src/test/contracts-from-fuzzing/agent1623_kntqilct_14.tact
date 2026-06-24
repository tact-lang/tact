struct EmptyOptionalStruct {
    x: Int?;
}

contract NullByDefault {
    s: EmptyOptionalStruct;

    init() {
        self.s = EmptyOptionalStruct{};
    }
}