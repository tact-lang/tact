struct Nested {
    v: Int = 5;
}

struct BigStruct {
    f1: Int = 1;
    f2: Int?;
    f3: Bool = true;
    f4: Bool?;
    f5: String = "abc";
    f6: String?;
    f7: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f8: Address?;
    f9: Slice?;
    f10: Cell?;
    f11: Nested = Nested{};
    f12: Nested?;
    f13: Int?;
    f14: Bool?;
}

contract LargeStructField {
    s: BigStruct = BigStruct{};
}