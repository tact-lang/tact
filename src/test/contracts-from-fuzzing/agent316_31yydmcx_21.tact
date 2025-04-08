struct OrderTest {
    a: Int;
    b: Int?;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;
}

contract TestOrder {
    data: OrderTest;

    init() {
        self.data = OrderTest{
            a:1, b:null, c:true, d:5, e:null, f:"x"
        };
    }
}