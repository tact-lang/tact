struct WeirdOrder {
    b:Bool;
    a:Int;
    d:String;
    c:Address;
}

contract WeirdOrderTest {
    obj: WeirdOrder;
    init() {
        self.obj = WeirdOrder{ b:true, a:1, d:"s", c:myAddress() };
    }
}