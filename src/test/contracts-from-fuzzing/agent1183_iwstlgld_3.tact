struct DeepInner {
    enabled: Bool;
    note: String;
}

struct Middle {
    count: Int;
    sub: DeepInner;
}

struct Outer {
    title: String;
    middle: Middle;
}

contract DeepNestContract {
    info: Outer;

    init() {
        self.info = Outer{
            title: "outer",
            middle: Middle{
                count: 7,
                sub: DeepInner{
                    enabled: false,
                    note: "deep",
                },
            },
        };
    }
}