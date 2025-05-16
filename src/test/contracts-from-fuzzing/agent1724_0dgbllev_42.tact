struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: Int?;
    inner4: Bool?;
}

contract TopLevel {
    field1: BigNested;
    field2: Int;

    init() {
        self.field1 = BigNested{ inner1: 5, inner2: true, inner3: null, inner4: null };
        self.field2 = 99;
    }
}