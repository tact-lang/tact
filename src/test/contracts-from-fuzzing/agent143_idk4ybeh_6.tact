struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Bool?; e: Bool?;
    f: Cell?; g: Address?; h: Slice?; i: Builder?;
}

contract OptionalFields {
    store: ManyOptionals;
    init() {
        self.store = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null
        };
    }
}