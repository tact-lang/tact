contract ParamStyle(
    foo: Int,
    bar: Bool,
    baz: Int? 
) {
    receive() {
        let _ = self.foo + 1;
    }
}