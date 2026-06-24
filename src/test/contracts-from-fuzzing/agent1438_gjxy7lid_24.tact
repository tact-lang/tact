struct MixedFields {
    int1: Int = 1;
    int2: Int = 2;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "a";
    str2: String = "b";
    addr1: Address? = null;
    addr2: Address? = null;
    bool3: Bool? = null;
    str3: String? = null;
}

contract MultiTypeDefaults {
    data: MixedFields = MixedFields{};
}