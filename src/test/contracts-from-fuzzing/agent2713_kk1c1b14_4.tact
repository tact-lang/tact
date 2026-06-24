struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Cell?;
    f: Address?;
}

contract TestContract {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a: null,
            b: 123,
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}
