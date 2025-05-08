struct LargeStruct {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    int9: Int;
    int10: Int;
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
    flag10: Bool;
    str1: String;
    str2: String;
    str3: String;
    str4: String;
    str5: String;
}

contract TestContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            int1: 1,
            int2: 2,
            int3: 3,
            int4: 4,
            int5: 5,
            int6: 6,
            int7: 7,
            int8: 8,
            int9: 9,
            int10: 10,
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false,
            flag5: true,
            flag6: false,
            flag7: true,
            flag8: false,
            flag9: true,
            flag10: false,
            str1: "a",
            str2: "b",
            str3: "c",
            str4: "d",
            str5: "e"
        };
    }
}
