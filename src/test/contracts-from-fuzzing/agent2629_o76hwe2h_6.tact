struct DeepNested {
    str: String;
    optSub: SubNested?;
}

struct SubNested {
    flag: Bool;
    optInner: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract UseNested {
    storage: DeepNested = DeepNested{
        str: "hello",
        optSub: null
    };

    init() {}
}