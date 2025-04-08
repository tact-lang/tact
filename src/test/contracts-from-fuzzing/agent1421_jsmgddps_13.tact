struct InnerDefaulted {
    val: Int = 42;
}

struct WrapOptional {
    nested: InnerDefaulted?;
}

contract DefaultsAndOptionals {
    test: WrapOptional = WrapOptional{nested: null};
}