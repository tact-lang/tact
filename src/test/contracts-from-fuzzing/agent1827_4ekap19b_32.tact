contract LargeOptionalString {
    longStr: String? = "This is a very long default string in an optional. This may trigger edge cases in serialization or storage layouts.";

    init() {}
}