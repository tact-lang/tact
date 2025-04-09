struct ManyOptional {
    foo: Int?;
    bar: Bool?;
    baz: Int?;
    qux: Bool?;
}

contract TestContract {
    mopt: ManyOptional = ManyOptional{
        foo: null,
        bar: null,
        baz: 123,
        qux: true
    };
}