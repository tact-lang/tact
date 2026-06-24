struct TestStruct {
    s: String = "";
    optS: String?;
}

contract EmptyStringDefaults {
    val: TestStruct;

    init() {
        self.val = TestStruct{
            s: "X",
            optS: null,
        };
    }
}
