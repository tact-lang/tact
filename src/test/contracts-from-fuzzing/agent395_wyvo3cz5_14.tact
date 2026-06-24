struct IntOrdering {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
}

contract SerialOrder {
    val: IntOrdering;
    init() {
        self.val = IntOrdering{
            a:1,b:-10,c:100
        };
    }
}