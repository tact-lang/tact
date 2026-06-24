struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    text: String;
}

contract DeepFieldSerial {
    stored: Outer;

    init() {
        self.stored = Outer{
            middle: Middle{
                inner: InnerMost{value: 77},
                flag: false,
            },
            text: "text",
        };
    }
}