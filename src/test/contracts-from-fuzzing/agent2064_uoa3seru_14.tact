struct InnerA {
    val: Int?;
}

struct InnerB {
    flag: Bool?;
    nested: InnerA?;
}

contract DeepOpt {
    d: InnerB = InnerB{
        flag: null,
        nested: null
    };
}
