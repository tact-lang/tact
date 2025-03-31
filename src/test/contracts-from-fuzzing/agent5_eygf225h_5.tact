@interface("TestInterface")
contract TestInterfaceContract {
    foo: Int;

    init() {
        self.foo = 10;
    }

    get fun getFoo(): Int {
        return self.foo;
    }
}
