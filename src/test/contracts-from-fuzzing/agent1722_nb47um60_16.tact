struct TestOrder {
    s: String;
    b: Bool;
    i: Int;
}

contract FieldOrder {
    f: TestOrder;

    init() {
        self.f = TestOrder{
            s:"str",
            b:true,
            i:777
        };
    }
}