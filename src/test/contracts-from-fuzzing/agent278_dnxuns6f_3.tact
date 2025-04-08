struct ManyOptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalsInStorage {
    data: ManyOptionalFields;
    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}