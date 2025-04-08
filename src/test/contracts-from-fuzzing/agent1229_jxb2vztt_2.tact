struct DeepInner {
    flag: Bool;
    note: String;
}

struct Middle {
    num: Int;
    opt: DeepInner?;
}

struct Outer {
    inner: Middle;
    alsoOpt: Middle?;
    flag: Bool;
    message: String;
}

contract StructNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Middle{
                num: 42,
                opt: DeepInner{
                    flag: true,
                    note: "deep"
                },
            },
            alsoOpt: null,
            flag: false,
            message: "test"
        };
    }
}
