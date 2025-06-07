contract ContractParamsStyle(
    foo: Int,
    bar: Bool,
    text: String,
    optVal: Int?,
) {
    receive() {
        let _ = self.foo + 1;
    }
}