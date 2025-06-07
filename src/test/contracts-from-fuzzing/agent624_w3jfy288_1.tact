contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    text: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.text = "hello";
    }
}