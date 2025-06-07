struct FieldsOrder {
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    data: FieldsOrder;

    init() {
        self.data = FieldsOrder{c: false, a: 5, b: "ok"};
    }
}