struct OptionalBundle {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

contract BundleHolder {
    bundle: OptionalBundle;

    init() {
        self.bundle = OptionalBundle{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: 7
        };
    }
}