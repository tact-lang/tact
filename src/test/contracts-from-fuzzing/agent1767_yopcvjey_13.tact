struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

struct Holder {
    nested: OptionalNested?;
}

contract OptionalHolder {
    s: Holder;

    init() {
        self.s = Holder{ nested: null };
    }
}
