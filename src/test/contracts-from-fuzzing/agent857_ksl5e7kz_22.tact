struct OptionalWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    note: String? = null;
}

contract TestContract {
    optdef: OptionalWithDefaults = OptionalWithDefaults{};
}