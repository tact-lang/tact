struct Inner {
    val: Int = 16;
    flag: Bool = false;
}

struct Outer {
    top: Int = 1;
    nestedOpt: Inner? = null;
}

contract TestOverrideOptNested {
    data: Outer = Outer{
        top: 5,
        nestedOpt: Inner{ val: 99, flag: true }
    };
    init() {}
}