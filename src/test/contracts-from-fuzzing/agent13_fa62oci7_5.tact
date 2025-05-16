struct TestStruct {
    x: Int;
    y: Int;
}

contract DefaultAndExplicit {
    val: TestStruct = TestStruct{ x: 1, y: 2 };

    init() {
        self.val = TestStruct{ x: 3, y: 4 };
    }
}