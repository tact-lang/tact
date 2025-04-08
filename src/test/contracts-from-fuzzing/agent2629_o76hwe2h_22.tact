struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract NestedOpts {
    store: OptStruct = OptStruct{
        a: null,
        b: null,
        c: null,
        d: null
    };

    init() {}
}