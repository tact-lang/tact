struct MyStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optData: MyStruct?;

    init() {
        self.optData = MyStruct{ foo: 42, bar: true };
    }
}