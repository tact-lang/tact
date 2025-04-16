struct ParamWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
}

contract ParamDefaults(
    p: ParamWithDefaults,
) {}