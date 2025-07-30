struct WDefaults {
    foo: Int? = null;
    bar: String? = "hello";
}

contract ParamNestedDefaults(
    config: WDefaults?
) {}