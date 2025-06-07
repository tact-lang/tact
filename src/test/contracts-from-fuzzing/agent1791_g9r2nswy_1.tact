struct DeepNest {
    inner: Inner;
    num: Int;
}

struct Inner {
    flag: Bool?;
    val: Int;
}

contract Test2 {
    data: DeepNest = DeepNest{ inner: Inner{ flag: null, val: 7 }, num: 9 };
    init() {}
}
