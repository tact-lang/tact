struct NestOpt {
    foo: Inner?;
}

struct Inner {
    bar: Int;
    baz: Bool;
    msg: String?;
}

contract TestContract {
    val: NestOpt = NestOpt{
        foo: Inner{
            bar: -99,
            baz: true,
            msg: null
        }
    };
}