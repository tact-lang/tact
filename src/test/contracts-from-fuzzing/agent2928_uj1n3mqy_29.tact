struct OptionalNestedStringSlice {
    s: String?;
    sl: Slice?;
}

contract OptionalNestedStringSliceField {
    f: OptionalNestedStringSlice = OptionalNestedStringSlice{ s: null, sl: null };
}