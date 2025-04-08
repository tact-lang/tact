struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    optals: ManyOptionals;

    init() {
        self.optals = ManyOptionals{
            a: null,
            b: true,
            c: "hello",
            d: null
        };
    }
}