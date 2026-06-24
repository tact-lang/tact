struct NestedOpt {
    maybe: Int?;
    sure: Int;
}

struct Wrapper {
    foo: NestedOpt?;
}

contract OptWrap {
    bar: Wrapper = Wrapper{
        foo: null
    };
}
