struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOptionalsContract {
    data: WithManyOptionals;

    init() {
        self.data = WithManyOptionals{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null
        };
    }
}