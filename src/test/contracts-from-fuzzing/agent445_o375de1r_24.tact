// Testing maximum optional + defaults structure
struct Out {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptDefaultsMax {
    nested: Out = Out{};
}
