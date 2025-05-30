struct EmbedA {
    foo: Int?;
    bar: Bool?;
}
struct EmbedB {
    inner: EmbedA;
    label: String;
}
contract ParamNestedStructs(
    p1: EmbedA,
    p2: EmbedB,
) {
    receive() {
        let _ = self.p2.inner.foo;
    }
}