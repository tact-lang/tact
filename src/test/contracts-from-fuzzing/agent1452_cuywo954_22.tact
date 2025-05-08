struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

struct OptionalWrap {
    nested: ManyOptionals?;
}

contract OptionalStructWrap {
    data: OptionalWrap;

    init() {
        self.data = OptionalWrap{
            nested: ManyOptionals{
                a: 1,
                b: false,
                c: null,
                d: null,
                e: null,
                f: null
            }
        };
    }
}
