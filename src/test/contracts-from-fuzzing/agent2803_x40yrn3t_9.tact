struct StringIntStruct {
    x: String;
    y: Int;
}

struct HoldsStruct {
    s: StringIntStruct;
    flag: Bool;
}

contract NestedStructFields {
    data: HoldsStruct;

    init() {
        self.data = HoldsStruct{
            s: StringIntStruct{x: "test", y: 99},
            flag: true
        };
    }
}