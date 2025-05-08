struct StringsNesting {
    optStr1: String?;
    optStr2: String?;
    str1: String = "first";
    str2: String = "second";
}

contract NestedStrings {
    textData: StringsNesting = StringsNesting{};
}