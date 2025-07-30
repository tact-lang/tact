struct MyStruct {
    x: Int;
    y: Bool;
}

contract OptStructVar {
    data: MyStruct?;

    init() {
        self.data = null;
        self.data = MyStruct{ x: 12, y: true };
    }
}