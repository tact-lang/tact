struct EmptyStringInner {
    s: String = "";
}

contract EmptyStringStructField {
    field: EmptyStringInner = EmptyStringInner{};
}