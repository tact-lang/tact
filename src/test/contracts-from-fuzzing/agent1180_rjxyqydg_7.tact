struct InnerLevel2 {
    s: String;
    flag: Bool;
}

struct InnerLevel1 {
    nested: InnerLevel2;
    val: Int;
}

struct OuterMost {
    nest1: InnerLevel1;
    nest2: InnerLevel2;
}

contract MultiNestedTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            nest1: InnerLevel1{
                nested: InnerLevel2{
                    s: "deep",
                    flag: true,
                },
                val: 77,
            },
            nest2: InnerLevel2{
                s: "again",
                flag: false,
            },
        };
    }
}
