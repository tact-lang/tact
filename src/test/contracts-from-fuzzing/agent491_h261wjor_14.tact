struct SI {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
    f: Slice?;
}

contract OptionalSet {
    data: SI;
    init() {
        self.data = SI{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}