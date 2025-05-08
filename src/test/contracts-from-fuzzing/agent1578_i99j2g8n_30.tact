struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Builder?;
}

contract BigOptionalPersistent {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}