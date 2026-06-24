struct MyStruct {
    a: Int;
    b: Bool;
}

contract OverridePartial {
    s: MyStruct = MyStruct{ a: 1, b: false };

    init() {
        self.s = MyStruct{ a: 42, b: true };
    }
}