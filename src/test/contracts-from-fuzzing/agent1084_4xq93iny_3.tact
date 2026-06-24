struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract MultipleOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}