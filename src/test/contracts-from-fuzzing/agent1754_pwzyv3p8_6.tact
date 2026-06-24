struct Sub {
    f: Int;
    g: Bool;
}

struct WrapOptional {
    optSub: Sub?;
    tag: String;
}

contract OptionalNested {
    data: WrapOptional = WrapOptional{
        optSub: null,
        tag: "empty"
    };

    init() {}
}