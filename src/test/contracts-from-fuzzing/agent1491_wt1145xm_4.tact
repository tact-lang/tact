struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OptionalStructField {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}