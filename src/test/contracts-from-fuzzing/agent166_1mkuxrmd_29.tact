struct OptionalStuff {
    n: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract TestContract {
    stuff: OptionalStuff;

    init() {
        self.stuff = OptionalStuff{
            n: null,
            b: null,
            s: null,
            a: null,
        };
    }
}