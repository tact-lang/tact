struct StrangeOrder {
    opt1: Int?;
    fld1: Int;
    opt2: Bool?;
    fld2: Bool;
    opt3: String?;
    fld3: String;
}

contract StrangeOrderTest {
    data: StrangeOrder;
    init() {
        self.data = StrangeOrder{
            opt1: null,
            fld1: 1,
            opt2: null,
            fld2: true,
            opt3: null,
            fld3: "abc",
        };
    }
}
