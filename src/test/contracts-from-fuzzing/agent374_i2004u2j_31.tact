// Contract parameter list with many fields
contract ParamStyle(
    foo: Int,
    bar: Bool,
    baz: String,
    optVal: Int?,
    flag: Bool,
    addr: Address
) {
    receive() {
        let _ = self.foo;
        let _ = self.bar;
        let _ = self.baz;
    }
}