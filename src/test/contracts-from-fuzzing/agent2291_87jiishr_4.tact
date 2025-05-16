struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalsStorage {
    state: WithManyOptionals;

    init() {
        self.state = WithManyOptionals{
            a: null,
            b: true,
            c: "hello",
            d: null,
        };
    }
}
