struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Slice?;
}

contract MultipleOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: 5,
            c: true,
            d: null,
            e: null,
        };
    }
}
