struct ComboStruct {
    flag1: Bool;
    int1: Int;
    msg: String;
    flag2: Bool;
    int2: Int;
    flag3: Bool;
    int3: Int;
    flag4: Bool;
    int4: Int;
    flag5: Bool;
    int5: Int;
}

contract MixedComboStorage {
    data: ComboStruct;

    init() {
        self.data = ComboStruct{
            flag1: true,
            int1: 1,
            msg: "Hello combo",
            flag2: false,
            int2: 2,
            flag3: true,
            int3: 3,
            flag4: false,
            int4: 4,
            flag5: true,
            int5: 5
        };
    }
}
