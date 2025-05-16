struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    st: WithOptionals;

    init() {
        self.st = WithOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: myAddress()
        };
    }
}