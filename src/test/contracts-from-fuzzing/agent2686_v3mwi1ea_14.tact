struct FieldOrder {
    a: Int;
    b: Bool;
    c: String;
}

contract SameNamesDifferentOrder {
    x: FieldOrder;
    y: FieldOrder;

    init() {
        self.x = FieldOrder{a:1, b:true, c:"x"};
        self.y = FieldOrder{a:2, b:false, c:"y"};
    }
}
