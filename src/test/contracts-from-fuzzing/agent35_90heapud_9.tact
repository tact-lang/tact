struct StructWithStringDefaults {
    s1: String = "hello";
    s2: String = "";
    s3: String = "foo";
}

contract ContractWithStringDefaults {
    data: StructWithStringDefaults = StructWithStringDefaults{};
}