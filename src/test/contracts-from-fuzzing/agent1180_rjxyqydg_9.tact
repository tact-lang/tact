struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int?;
    f7: Bool;
    f8: String;
    f9: Bool?;
    f10: Int;
}

contract BigStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            f1: 1,
            f2: true,
            f3: "three",
            f4: null,
            f5: null,
            f6: null,
            f7: false,
            f8: "eight",
            f9: true,
            f10: 10,
        };
    }
}
