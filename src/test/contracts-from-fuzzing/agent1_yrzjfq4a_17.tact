struct MultiOptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract MultiOptionStorage {
    s: MultiOptionStruct;

    init() {
        self.s = MultiOptionStruct{
            a: null, b: null, c: "hi", d: null, e: emptyCell()
        };
    }
}