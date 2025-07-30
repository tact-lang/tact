struct MultiOpt {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract StructOptionals {
    s: MultiOpt = MultiOpt {
        foo: null,
        bar: null,
        name: null,
    };

    init() {}
}