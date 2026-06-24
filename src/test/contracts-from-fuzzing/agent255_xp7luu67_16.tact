// test contract with bool and Int defaults
contract TestContract {
    foo: Int = 42;
    bar: Bool = false;

    init() {
        self.foo = -12;
        self.bar = true;
    }
}