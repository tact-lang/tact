struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptionalsContract {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}