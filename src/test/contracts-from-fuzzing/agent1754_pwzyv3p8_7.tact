struct Sub {
    f: Int;
    g: Bool;
}

struct WrapOptional {
    optSub: Sub?;
    tag: String;
}

contract OptionalNestedNonNull {
    data: WrapOptional = WrapOptional{
        optSub: Sub{ f: 1, g: true },
        tag: "nonnull"
    };

    init() {}
}