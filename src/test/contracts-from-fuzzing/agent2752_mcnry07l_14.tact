struct NestedString {
    s: String = "hi";
}

contract StringStructField {
    strStruct: NestedString = NestedString{};
}