struct TestStruct {
    num: Int;
    flag: Bool;
    text: String;
}

contract NoDefaults {
    s: TestStruct;
    init() {
        self.s = TestStruct{num:123, flag:true, text:"abc"};
    }
}