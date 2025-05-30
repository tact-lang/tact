struct FieldOrder {
    c: Int;
    a: Int;
    b: Int;
}

contract TestContract {
    order: FieldOrder;

    init() {
        self.order = FieldOrder{ c:1, a:2, b:3 };
    }
}