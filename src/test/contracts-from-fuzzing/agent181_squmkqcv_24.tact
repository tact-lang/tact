struct DataPack {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract OptionalData {
    pack: DataPack;

    init() {
        self.pack = DataPack{
            a: 1,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
