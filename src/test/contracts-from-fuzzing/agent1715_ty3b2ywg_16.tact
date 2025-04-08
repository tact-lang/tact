struct OptionalWithDefaults {
    field1: Int?;
    field2: String? = null;
    field3: Bool? = true;
}

contract TestContract {
    s: OptionalWithDefaults = OptionalWithDefaults{
        field1: null
    };
}