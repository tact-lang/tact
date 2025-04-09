struct Params {
    foo: Int;
    bar: Bool;
}

contract Test(
    nested: Params,
) {
    receive() {
        dump(self.nested.foo);
    }
}