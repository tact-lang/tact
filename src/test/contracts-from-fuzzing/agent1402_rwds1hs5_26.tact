struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract ParamWithDefaults(
    foo: IntDefaults
) {}