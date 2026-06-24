struct TestStruct {
    intField: Int?;
    strField: String?;
    boolField: Bool?;
}

contract NullOptInit {
    s: TestStruct;

    init() {
        self.s = TestStruct{intField:null,strField:null,boolField:null};
    }
}