struct DeepInner {
    val: Int;
    flag: Bool;
}

struct Middle {
    inner: DeepInner;
    text: String;
    optionalFlag: Bool?;
}

struct Outer {
    m: Middle;
    s: String;
    optionalInt: Int?;
}

contract DeepNestingTest {
    store: Outer;

    init() {
        self.store = Outer{
            m: Middle{
                inner: DeepInner{
                    val: 7,
                    flag: true,
                },
                text: "hi",
                optionalFlag: false,
            },
            s: "hello",
            optionalInt: null,
        };
    }
}