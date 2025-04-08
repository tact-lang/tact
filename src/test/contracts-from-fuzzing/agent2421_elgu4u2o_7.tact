struct ManyOptional {
    a: Int?;
    b: Int?;
    c: String?;
    d: Address?;
    e: Bool?;
    f: Cell?;
    g: Slice?;
    h: Builder?;
}

contract ManyOptFields {
    val: ManyOptional;

    init() {
        self.val = ManyOptional{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null
        };
    }
}