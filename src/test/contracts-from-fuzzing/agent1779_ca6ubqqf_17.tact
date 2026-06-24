struct FieldsOrderTest {
    x: Int;
    y: Bool;
    z: Int?;
}

contract FieldsOrderContract {
    data: FieldsOrderTest;
    init() {
        self.data = FieldsOrderTest{x:1, y:true, z:null};
    }
}