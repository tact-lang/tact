struct FlagStruct {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
}

struct StrStruct {
    str1: String = "Hello";
    str2: String = "World";
}

contract Mixed {
    f: FlagStruct = FlagStruct{ flag1: true, flag2: false, flag3: true };
    s: StrStruct = StrStruct{ str1: "Hi", str2: "There" };
    init() {}
}