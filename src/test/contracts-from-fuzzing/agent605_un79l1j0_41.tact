struct MyStruct {
    a: Int;
    b: Bool;
}

contract OptStruct {
    s: MyStruct?;

    init() {
        self.s = null;
    }
}