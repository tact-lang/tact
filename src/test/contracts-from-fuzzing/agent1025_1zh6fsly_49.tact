struct EmbedOptionals {
    foo: Int?;
    bar: Bool?;
}

contract EmbeddedWithDefaults {
    e: EmbedOptionals = EmbedOptionals{ foo:null, bar:null };
}
