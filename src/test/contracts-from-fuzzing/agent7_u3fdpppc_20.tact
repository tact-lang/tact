struct EmptyOptStruct {
    a: Int?;
}

contract NullNested {
    empty: EmptyOptStruct?;

    init() {
        self.empty = null;
    }
}