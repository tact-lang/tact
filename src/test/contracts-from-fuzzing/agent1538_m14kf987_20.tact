struct MyStruct {
    foo: Int;
}

contract TestContract {
    optField: MyStruct?;

    init() {
        self.optField = null;
    }
}