struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalStorage {
    data: DeeplyOptional?;

    init() {
        self.data = null;
    }
}
