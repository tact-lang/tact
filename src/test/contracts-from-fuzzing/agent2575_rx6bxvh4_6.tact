struct NestedOptional {
    inner: OptionalFields?;
}

struct OptionalFields {
    foo: Int?;
    bar: Bool;
}

contract TestContract {
    nestOpt: NestedOptional = NestedOptional{
        inner: OptionalFields{
            foo: null,
            bar: false
        }
    };
}