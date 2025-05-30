struct OutOrder {
    a: Int;
    b: Bool;
}

contract FieldAccessOrder {
    f: OutOrder;

    init() {
        self.f = OutOrder{ b:true, a:42 };
    }
}