struct LongerNested {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: InnerLevel2;
}

struct InnerLevel2 {
    a: Int?;
    b: InnerLevel3;
}

struct InnerLevel3 {
    s: String;
    optFlag: Bool?;
}

contract LongNestTest {
    data: LongerNested;

    init() {
        self.data = LongerNested{
            f1: 10,
            f2: false,
            f3: "hello",
            f4: InnerLevel2{
                a: null,
                b: InnerLevel3{
                    s: "deep",
                    optFlag: true
                }
            }
        };
    }
}