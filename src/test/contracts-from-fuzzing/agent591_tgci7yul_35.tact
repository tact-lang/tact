struct MyStruct {
    a: Int;
    b: Bool;
}

contract Simple {
    s: MyStruct;
    init() {
        self.s = MyStruct{ a: 10, b: true };
    }
}