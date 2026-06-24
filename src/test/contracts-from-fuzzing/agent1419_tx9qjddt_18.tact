contract NestedParamContract(
    foo: Int,
    bar: String,
    baz: Bool
) {
    receive() {
        dump(self.foo);
        dump(self.bar);
        dump(self.baz);
    }
}