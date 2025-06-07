struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract TestContract {
    d: WithManyOptionals;

    init() {
        self.d = WithManyOptionals{
            a: null,
            b: true,
            s: null,
            addr: null
        };
    }
}