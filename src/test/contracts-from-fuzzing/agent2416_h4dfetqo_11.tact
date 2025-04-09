struct OptionalStructField {
    opt: Inner?;
}

struct Inner {
    foo: Int;
}

contract OptionalStructTest {
    value: OptionalStructField = OptionalStructField{
        opt: Inner{foo:7}
    };
}