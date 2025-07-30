struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool?;
    f9: String;
    f10: Int;
}

contract LongFieldsTest {
    data: LongList;

    init() {
        self.data = LongList{
            f1: 1,
            f2: false,
            f3: "a",
            f4: 2,
            f5: null,
            f6: "b",
            f7: 3,
            f8: true,
            f9: "c",
            f10: 4,
        };
    }
}