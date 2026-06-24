struct OutOfOrder {
    c: Int;
    a: Int;
    b: Int;
}

contract FieldOrderTest {
    val: OutOfOrder;
    
    init() {
        self.val = OutOfOrder{ c:3, a:1, b:2 };
    }
}