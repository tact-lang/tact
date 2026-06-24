struct Foo {
    bar: Int?;
}

contract TestContract(
    foo: Foo?,
) {
    receive() {
        if (self.foo != null) {
            dump(self.foo!!.bar);
        }
    }
}