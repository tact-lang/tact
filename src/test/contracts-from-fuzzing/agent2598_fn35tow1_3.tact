struct LongList {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: String?;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int?;
}

contract ManyFields {
    data: LongList;

    init() {
        self.data = LongList{
            f1: 1, f2: true, f3: null, f4: false, f5: 5,
            f6: "str", f7: 7, f8: "s", f9: true, f10: 10
        };
    }
}