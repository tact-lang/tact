struct MyStruct {
    value: Int;
}

contract TestContract {
    a: MyStruct;
    init() {
        self.a = MyStruct { value: 1 };
    }
    receive() {
        let b: Int = self.a.value;
    }
}