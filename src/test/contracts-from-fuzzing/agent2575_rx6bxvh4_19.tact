struct OptionalOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
}

contract TestContract {
    val: OptionalOptional = OptionalOptional{
        inner: null
    };
}