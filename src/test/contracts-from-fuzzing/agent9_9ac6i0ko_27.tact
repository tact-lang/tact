struct WeirdOrder {
    f3: Int;
    f1: Bool;
    f2: String;
}

contract StructWeirdOrder {
    s: WeirdOrder = WeirdOrder{ f3:1, f1:true, f2:"s" };

    init() {
        self.s = WeirdOrder{ f3:42, f1:false, f2:"x" };
    }
}