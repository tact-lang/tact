struct BigNested {
    title: String;
    description: String?;
    flagA: Bool?;
    flagB: Bool?;
    note: String?;
    numA: Int?;
    numB: Int as uint32;
    comment: String?;
    active: Bool;
}

contract LargeComplex {
    data: BigNested;

    init() {
        self.data = BigNested{
            title: "hello",
            description: null,
            flagA: true,
            flagB: null,
            note: "note",
            numA: null,
            numB: 1234,
            comment: "sample",
            active: true
        };
    }
}