struct Inner {
    foo: Int = 11;
    bar: Bool = true;
}

struct Outer {
    reqInt: Int;
    optInt: Int?;
    optStr: String?;
    nestedReq: Inner;
    nestedOpt: Inner?;
}

contract TestMixNestOpt {
    data: Outer = Outer{
        reqInt: 5,
        optInt: null,
        optStr: null,
        nestedReq: Inner{},
        nestedOpt: Inner{ foo: 7, bar: false }
    };
    init() {}
}