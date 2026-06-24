struct ComposeOptionalDeeper {
    outer: Outer?;
}

struct Outer {
    middle: Middle?;
    str: String;
}

struct Middle {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    num: Int;
    txt: String?;
}

contract ComposeOptionalDeepTest {
    data: ComposeOptionalDeeper;

    init() {
        self.data = ComposeOptionalDeeper{
            outer: Outer{
                middle: Middle{
                    inner: Inner{
                        num: 999,
                        txt: "deep"
                    },
                    flag: false
                },
                str: "outer"
            }
        };
    }
}
