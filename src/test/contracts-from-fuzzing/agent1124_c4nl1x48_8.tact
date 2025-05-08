struct DefaultsOpt {
    foo: Int = 42;
    bar: Bool?;
    baz: String = "test";
}

contract InlineDefaultStruct {
    val: DefaultsOpt = DefaultsOpt{};
}