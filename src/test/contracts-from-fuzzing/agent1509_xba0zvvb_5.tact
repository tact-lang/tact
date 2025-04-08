struct DeepOptionals {
    s: String?;
    n: Int?;
    b: Bool?;
    a: Address?;
}

contract OptionalContract {
    optfield: DeepOptionals;

    init() {
        self.optfield = DeepOptionals {
            s: null,
            n: 42,
            b: true,
            a: null
        };
    }

    receive() {
        if (self.optfield.b != null && self.optfield.b!!) {
            let x = self.optfield.n;
        }
    }
}