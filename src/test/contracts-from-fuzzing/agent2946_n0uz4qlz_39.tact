struct FieldOrder {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
}
contract OrderTest {
    data: FieldOrder;
    init() {
        self.data = FieldOrder{
            a:1, b:true, c:2, d:false
        };
    }
}