struct Mid {
    foo: Int;
    bar: String?;
}

struct TopOptionals {
    a: Mid?;
    b: Mid?;
    c: Mid?;
}

contract MultiplyOptionalStructs {
    store: TopOptionals;
    
    init() {
        self.store = TopOptionals{
            a: null,
            b: Mid{ foo: 1, bar: null },
            c: null
        };
    }
}
