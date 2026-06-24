struct DeepInner {
    a: Int;
    b: Bool;
}

struct Middle {
    c: String;
    d: DeepInner;
    e: Int?;
}

contract DeepNested {
    data: Middle;

    init() {
        self.data = Middle{
            c: "hi",
            d: DeepInner{
                a: 5,
                b: false
            },
            e: null
        };
    }
}