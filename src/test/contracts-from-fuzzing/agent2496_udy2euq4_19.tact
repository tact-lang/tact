struct SubStruct1 {
    name: String;
    count: Int;
}

struct SubStruct2 {
    flag: Bool?;
    value: Int?;
}

contract TwoStructsPersistent {
    s1: SubStruct1;
    s2: SubStruct2;

    init() {
        self.s1 = SubStruct1{
            name: "test",
            count: 123,
        };
        self.s2 = SubStruct2{
            flag: null,
            value: 999,
        };
    }
}
