struct HasString {
    s1: String;
    s2: String;
}

struct StructWithBool {
    flag: Bool;
    next: HasString;
}

struct LargeFieldStruct {
    num1: Int;
    num2: Int;
    wrap: StructWithBool;
}

contract NestedStrings {
    persist: LargeFieldStruct;

    init() {
        self.persist = LargeFieldStruct{
            num1: 1,
            num2: 2,
            wrap: StructWithBool{
                flag: true,
                next: HasString{
                    s1: "alpha",
                    s2: "beta"
                }
            }
        };
    }
}
