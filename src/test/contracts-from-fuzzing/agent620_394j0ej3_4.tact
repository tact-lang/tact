struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: MyStruct;

    init() {
        self.data = MyStruct{a: 5, b: true};
    }

    receive() {
        let _ = self.data.a;
        let _ = self.data.b;
    }
}