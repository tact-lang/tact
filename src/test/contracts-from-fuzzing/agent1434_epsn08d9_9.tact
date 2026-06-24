struct MultiOpt {
    a: Int?;
    b: Int?;
}

struct NestOpts {
    inner: MultiOpt?;
}

contract Test {
    var: NestOpts = NestOpts{
        inner: null
    };

    receive() {}
}