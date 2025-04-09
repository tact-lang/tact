struct BigOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract OptionalStructField {
    field: BigOpt?;

    init() {
        self.field = null;
    }
}