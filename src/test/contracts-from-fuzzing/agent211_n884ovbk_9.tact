struct TestStruct {
    x: Int = 1;
    y: Bool;
    z: String = "default";
}

contract TestContract {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            y: true
        };
    }
}