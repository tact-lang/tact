struct DeepInner {
    val: Int;
    flag: Bool;
}

struct Middle {
    deep: DeepInner;
    text: String;
}

struct Outer {
    middle: Middle;
    number: Int;
}

contract TestContract {
    outer: Outer;
    init() {
        self.outer = Outer{
            middle: Middle{
                deep: DeepInner{
                    val: 123,
                    flag: true,
                },
                text: "hi",
            },
            number: 42,
        };
    }
}
