struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
}

contract TestManyOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: true,
            d: null
        };
    }
}