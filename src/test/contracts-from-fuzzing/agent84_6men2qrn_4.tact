struct DeepNested {
    a: Int;
    b: OptionLevel1?;
}

struct OptionLevel1 {
    c: Int;
    d: OptionLevel2?;
}

struct OptionLevel2 {
    e: Bool;
    f: String?;
}

contract DeepNestTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 10,
            b: OptionLevel1{
                c: 20,
                d: OptionLevel2{
                    e: true,
                    f: null,
                },
            },
        };
    }
}