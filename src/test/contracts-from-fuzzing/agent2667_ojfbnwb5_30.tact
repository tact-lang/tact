struct OrderedFields {
    a: Int;
    b: Bool;
    c: String;
}

struct DifferentOrder {
    c: String;
    a: Int;
    b: Bool;
}

contract FieldOrderTest {
    f1: OrderedFields;
    f2: DifferentOrder;

    init() {
        self.f1 = OrderedFields{a:1, b:true, c:"x"};
        self.f2 = DifferentOrder{c:"y", a:2, b:false};
    }

    receive() {
        self.f1 = OrderedFields{a:3, b:false, c:"z"};
        self.f2 = DifferentOrder{c:"w", a:4, b:true};
    }
}