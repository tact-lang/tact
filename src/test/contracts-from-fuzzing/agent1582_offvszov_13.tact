struct SubNested {
    val: Int;
}

struct NestedOpt {
    sub: SubNested?;
    flag: Bool?;
}

contract DeepOptional {
    nested: NestedOpt = NestedOpt{
        sub: null,
        flag: null,
    };
    simple: Int? = null;

    receive() {}
}