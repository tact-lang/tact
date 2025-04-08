struct OptionalNest {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionals {
    state: OptionalNest;

    init() {
        self.state = OptionalNest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }

    receive() {
        let _ = self.state;
    }
}