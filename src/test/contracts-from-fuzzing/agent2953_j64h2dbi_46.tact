// Large struct with many fields, initialized partially
struct ManyFields {
    f1: Int?;
    f2: Int?;
    f3: String?;
    f4: String?;
    f5: Bool?;
    f6: Bool?;
    f7: Int?;
    f8: Int?;
    f9: String?;
    f10: Bool?;
}

contract PartialLargeStruct {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            f3: "x",
            f4: null,
            f10: null
        };
    }
}