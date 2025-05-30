struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: true,
            c: 42,
            d: null,
            e: -1,
        };
    }
}