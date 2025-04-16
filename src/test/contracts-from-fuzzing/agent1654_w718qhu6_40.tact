struct DeepDefault {
    a: Int = 1;
    b: Bool = true;
}

struct WrapDeep {
    nested: DeepDefault;
}

contract ParamWrapDeep(
    param: WrapDeep
) {
    // Use nested defaults inside param
}