struct TestStruct {
    intField: Int = 0;
    boolField: Bool = false;
    strField: String = "";
}

contract OptTestStruct {
    t: TestStruct? = null;

    init() {
        self.t = TestStruct{ intField:44, boolField:true, strField:"hi" };
    }
}