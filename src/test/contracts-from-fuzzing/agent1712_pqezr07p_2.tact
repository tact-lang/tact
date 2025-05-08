struct MyStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nestedOpt: MyStruct? = null;

    init() {
        self.nestedOpt = null;
    }

    receive() {
        if (self.nestedOpt != null) {
            let val = self.nestedOpt!!.foo;
        }
    }
}