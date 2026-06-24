struct OptionalNest {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
}

contract OptionalPersistent {
    data: OptionalNest = OptionalNest{
        opt1: null,
        opt2: null,
        opt3: null
    };

    receive() {
        self.data = OptionalNest{
            opt1: 123,
            opt2: "now",
            opt3: true
        };
    }
}