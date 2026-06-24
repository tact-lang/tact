struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    onest: OptionalNest;

    init() {
        self.onest = OptionalNest{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}