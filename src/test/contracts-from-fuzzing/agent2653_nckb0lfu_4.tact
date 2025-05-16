struct DeepInner {
    val: Int?;
    text: String;
}

struct Mid {
    a: DeepInner;
    b: DeepInner;
}

struct Top {
    x: Mid;
    y: Mid;
    flag: Bool;
}

contract TestContract {
    storage: Top;
    init() {
        self.storage = Top{
            x: Mid{
                a: DeepInner{val: null, text: "X"},
                b: DeepInner{val: 11, text: "Y"}
            },
            y: Mid{
                a: DeepInner{val: null, text: "M"},
                b: DeepInner{val: 77, text: "N"}
            },
            flag: false,
        };
    }
}