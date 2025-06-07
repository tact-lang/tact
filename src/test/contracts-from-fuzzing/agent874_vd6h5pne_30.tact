struct WeirdOrder {
    x: Int;
    y: String;
    z: Bool;
}

contract TestOrder {
    a: WeirdOrder;

    init() {
        self.a = WeirdOrder{ z:true, x:123, y:"ok" };
    }
}
