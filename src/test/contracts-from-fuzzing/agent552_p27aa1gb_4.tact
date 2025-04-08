struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: WithOptionals;

    init() {
        self.s = WithOptionals{
            a: null,
            b: true,
            c: null,
        };
    }
}