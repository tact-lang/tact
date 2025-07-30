struct DeepFields {
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddr: Address? = null;
    optStr: String? = null;
    optSlice: Slice? = null;
}

contract OptionNest {
    nest: DeepFields = DeepFields{};
}