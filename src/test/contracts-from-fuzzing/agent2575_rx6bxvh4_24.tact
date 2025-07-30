struct OptionalStruct {
    opt: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    field: OptionalStruct = OptionalStruct{
        opt: Inner{
            foo: 1,
            bar: true
        }
    };
}