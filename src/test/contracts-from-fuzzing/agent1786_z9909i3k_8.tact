struct TestStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract InitSetAll {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            a: 123,
            b: "abc",
            c: true,
        };
    }
}