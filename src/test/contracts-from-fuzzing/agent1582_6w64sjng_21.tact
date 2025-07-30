struct OrderingTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Bool;
    d: String;
}

contract OrderingTestContract {
    t: OrderingTest;
    init() {
        self.t = OrderingTest{a:1,b:257,c:true,d:"hey"};
    }
}