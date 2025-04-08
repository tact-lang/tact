struct OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract ImplicitDefaultsParam(
    wrapped: OnlyDefaults
) {}