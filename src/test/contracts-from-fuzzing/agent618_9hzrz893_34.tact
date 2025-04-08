struct StrangeOrder {
    a: Int as uint8;
    b: Bool;
    c: Address;
    d: Int as int256;
    e: String;
}

contract WeirdTypesOrder {
    val: StrangeOrder;

    init() {
        self.val = StrangeOrder{
            a:1, b:true, c:myAddress(), d:88, e:"abc"
        };
    }
}