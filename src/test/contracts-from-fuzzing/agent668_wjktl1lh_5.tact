struct TestStruct {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    val: TestStruct;

    init() {
        self.val = TestStruct {
            a: 5,
            b: null,
            c: null,
            d: null,
        };
    }
}