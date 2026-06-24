trait T1 {
    foo: Int;
}
trait T2 {
    bar: Bool;
}

contract TestContract with T1, T2 {
    foo: Int;
    bar: Bool;
    baz: Address;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = myAddress();
    }
}