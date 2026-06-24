struct LargeStruct {
    f1: Int; f2: Bool; f3: String; f4: Address; f5: Bool?;
    f6: Int?; f7: String?; f8: Address?; f9: String; f10: Int;
}

contract LargeStructTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: false,
            f3: "a",
            f4: myAddress(),
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: "b",
            f10: 10
        };
    }
}