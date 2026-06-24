struct Flat {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptFlat {
    data: Flat;

    init() {
        self.data = Flat{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}