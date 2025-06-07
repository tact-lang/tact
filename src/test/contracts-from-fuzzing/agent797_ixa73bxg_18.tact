struct LeafOpt {
    foo: Int? = null;
    bar: Bool? = null;
}

struct MidOpt {
    leaf: LeafOpt = LeafOpt{};
    text: String = "abc";
}

struct RootOpt {
    mid: MidOpt;
    n: Int = 0;
}

contract TestNestedPartialOpt {
    data: RootOpt = RootOpt{
        mid: MidOpt{ text: "zzz" },
        n: 5
    };
    init() {}
}