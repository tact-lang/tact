struct FlatOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract FlatOptTest {
    mydata: FlatOpt;

    init() {
        self.mydata = FlatOpt{
            a: null,
            b: 1,
            c: null,
            d: true,
            e: "abc",
        };
    }
}
