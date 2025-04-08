struct Data {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String?;
    tail: Slice as remaining;
}

contract Test {
    data: Data;

    init() {
        self.data = Data{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: null,
            tail: emptyCell().asSlice()
        };
    }
}
