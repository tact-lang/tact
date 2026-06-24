contract ParamOptTest(
    foo: Int?,
    bar: Bool,
) {
    receive() {
        let _ = self.foo;
    }
}