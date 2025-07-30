struct MyStruct {
    x: Int;
    y: Bool;
}

contract Test {
    maybeStruct: MyStruct?;
    value: Int;

    init() {
        self.maybeStruct = null;
        self.value = 42;
    }
}