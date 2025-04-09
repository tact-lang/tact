struct InnerWithDefaults {
    a: Int = 2;
}

contract ParamsDefaultStructs(
    nested: InnerWithDefaults,
) {}