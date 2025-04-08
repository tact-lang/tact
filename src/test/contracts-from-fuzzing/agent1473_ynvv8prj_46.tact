struct OrderTest {
    a: Int as int8;
    b: Bool;
    c: Int;
    d: String;
    e: Bool;
    f: Int as uint8;
}

contract TestContract {
    ord: OrderTest;

    init() {
        self.ord = OrderTest{a:7,b:true,c:8,d:"lol",e:false,f:9};
    }
}