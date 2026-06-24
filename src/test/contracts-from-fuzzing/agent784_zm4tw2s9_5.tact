struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int?;
    h: Bool?;
}

contract ManyOptContract {
    o: WithManyOptionals;

    init() {
        self.o = WithManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 7,
            h: false
        };
    }
}