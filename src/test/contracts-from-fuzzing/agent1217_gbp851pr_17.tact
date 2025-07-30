struct TestStruct {
    str1: String;
    int1: Int;
    str2: String;
}

contract MixedOrder {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            str1: "alpha",
            int1: 10,
            str2: "beta",
        };
    }
}