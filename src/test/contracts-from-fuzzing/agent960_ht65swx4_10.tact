struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Slice?;
    g: Builder?;
}

contract OptionalFields {
    val: ManyOptionals;
    init() {
        self.val = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}