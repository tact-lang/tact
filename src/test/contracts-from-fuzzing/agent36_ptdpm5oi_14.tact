struct OptionalBundle {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionals {
    data: OptionalBundle;

    init() {
        self.data = OptionalBundle{
            a: 1, b: true, c: "yes", d: null, e: null, f: null
        };
    }

    receive() {
        let _ = self.data;
    }
}