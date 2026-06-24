struct DeepInner {
    a: Int;
    b: String?;
    c: Bool;
}

struct MidStruct {
    di: DeepInner;
    flag: Bool?;
}

struct TopStruct {
    mid: MidStruct;
    value: Int?;
}

contract DeepOptionalTest {
    store: TopStruct;

    init() {
        self.store = TopStruct{
            mid: MidStruct{
                di: DeepInner{
                    a: 1,
                    b: "abc",
                    c: false,
                },
                flag: null,
            },
            value: 42,
        };
    }
}