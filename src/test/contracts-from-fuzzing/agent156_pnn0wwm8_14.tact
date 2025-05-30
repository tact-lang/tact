struct RecStruct {
    inner: Bool;
    inner2: Int;
    inner3: String;
}

contract StructFieldOrderTest {
    field3: RecStruct;
    field1: Int;
    field2: Bool;

    init() {
        self.field1 = 1;
        self.field2 = false;
        self.field3 = RecStruct{ inner:true, inner2:5, inner3:"hi" };
    }
}
