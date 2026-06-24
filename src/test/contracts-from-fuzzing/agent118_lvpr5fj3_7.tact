struct Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract LotsOptional {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}