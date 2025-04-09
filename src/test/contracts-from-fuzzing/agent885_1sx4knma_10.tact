struct WithManyOptionals {
    i1: Int?;
    i2: Int?;
    s1: String?;
    s2: String?;
    b1: Bool?;
    b2: Bool?;
}

contract TestContract {
    optFields: WithManyOptionals;

    init() {
        self.optFields = WithManyOptionals{
            i1: null,
            i2: 10,
            s1: "foo",
            s2: null,
            b1: true,
            b2: null,
        };
    }
}