struct DeepInner {
    i: Int;
    s: String;
    b: Bool;
}

struct MiddleInner {
    di: DeepInner;
    flag: Bool;
    optInt: Int?;
}

struct OuterStruct {
    mi: MiddleInner;
    str: String;
    optBool: Bool?;
}

contract DeepStorageTest {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            mi: MiddleInner{
                di: DeepInner{
                    i: 42,
                    s: "deep",
                    b: false,
                },
                flag: true,
                optInt: null,
            },
            str: "outer",
            optBool: null,
        };
    }
}
