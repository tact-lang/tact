struct WithOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract TestOptionals {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            a: null, b: null, c: 42, d: true, e: null
        };
    }
}