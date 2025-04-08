struct WithManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: WithManyOptionals;

    init() {
        self.data = WithManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}