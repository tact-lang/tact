struct RichStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int?;
    f6: String?;
}

contract TestContract {
    data: RichStruct;

    init() {
        self.data = RichStruct{
            f1: 10,
            f2: false,
            f3: "test",
            f4: null,
            f5: null,
            f6: null
        };
    }
}