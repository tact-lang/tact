struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract TestContract {
    w: WithOptionals;

    init() {
        self.w = WithOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}