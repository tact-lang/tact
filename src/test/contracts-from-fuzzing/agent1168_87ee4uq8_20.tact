struct MultiOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract MultiOptStruct {
    storage: MultiOptionals;

    init() {
        self.storage = MultiOptionals {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}