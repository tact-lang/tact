// Testing struct with mixed field order
struct MixedOrder {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int;
    s2: String;
    b2: Bool;
}

contract MixedOrderFields {
    data: MixedOrder;

    init() {
        self.data = MixedOrder{
            i1:10, b1:true, s1:"x", i2:20, s2:"y", b2:false
        };
    }
}
