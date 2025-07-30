struct BoolVariations {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolStorage {
    data: BoolVariations;

    init() {
        self.data = BoolVariations{
            a: true,
            b: null,
            c: false,
            d: true,
        };
    }
}