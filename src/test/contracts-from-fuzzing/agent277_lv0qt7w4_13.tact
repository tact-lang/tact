struct DeepOptional {
    val: Int?;
    inner: Inner?;
}
struct Inner {
    value: Int;
}
contract Test {
    foo: DeepOptional;
    init() {
        self.foo = DeepOptional{
            val: null,
            inner: Inner{ value: 5 }
        };
    }
}