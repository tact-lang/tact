struct Combo {
    label: String?;
    signed: Int as int64;
    unsigned: Int as uint64;
}

contract NestedSerializations {
    data: Combo?;

    init() {
        self.data = null;
    }
}