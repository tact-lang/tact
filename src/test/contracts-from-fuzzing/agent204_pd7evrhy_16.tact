struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract OptionalFieldsEverywhereFixed {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }

    receive() {
        if (self.data.a == null) { self.data.a = 1; }
        if (self.data.b == null) { self.data.b = true; }
        if (self.data.c == null) { self.data.c = "hi"; }
    }
}