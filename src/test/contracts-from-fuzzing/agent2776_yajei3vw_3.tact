struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int?;
    f4: Bool;
    f5: Bool?;
    f6: String;
    f7: String?;
}

contract LargeTest {
    large: LargeStruct;

    init() {
        self.large = LargeStruct{
            f1: 1, f2: 2, f3: null, f4: true, f5: null, f6: "ok", f7: null
        };
    }
}
