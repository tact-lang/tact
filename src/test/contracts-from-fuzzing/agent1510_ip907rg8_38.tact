struct WeirdOrder {
    a: Int;
    b: InnerStruct;
    c: Int;
}

struct InnerStruct {
    val: Int;
}

contract StructOrderTest {
    s: WeirdOrder;

    init() {
        self.s = WeirdOrder{
            a: 10,
            b: InnerStruct{val:20},
            c: 30
        };
    }
}