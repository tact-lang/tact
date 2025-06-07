struct MyStruct { a: Int; }

contract DirectStructOpt {
    foo: MyStruct?;

    init() {
        self.foo = null;
    }
}