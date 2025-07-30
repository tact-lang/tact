struct TestStruct {
    one: Int;
    two: Int;
    three: Int;
}

contract GoodInit {
    param: TestStruct;

    init() {
        self.param = TestStruct{ one: 1, two: 2, three: 3 };
    }
}
