struct TestStruct {
    num: Int;
    optVal: Int?;
    flag: Bool?;
}

contract OptionalStructField {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            num: 17,
            optVal: null,
            flag: true
        };
    }
}