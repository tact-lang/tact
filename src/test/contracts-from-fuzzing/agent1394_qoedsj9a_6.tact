struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalStructField {
    z: Optionals;
    init() {
        self.z = Optionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null
        };
    }
}
