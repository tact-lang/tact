struct DeepNested {
    s1: String;
    s2: String;
}

struct InnerOpt {
    optInt: Int?;
    deep: DeepNested;
}

struct OuterOpt {
    n: InnerOpt?;
    flag: Bool;
}

contract OptTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            n: InnerOpt{
                optInt: null,
                deep: DeepNested{
                    s1: "abc",
                    s2: "def",
                },
            },
            flag: true,
        };
    }
}