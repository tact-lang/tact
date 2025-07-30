struct DeepInner {
    a: Int;
    b: Bool;
}

struct DeepMiddle {
    inn: DeepInner;
    c: String;
}

contract NestedStructs {
    s: DeepMiddle;

    init() {
        self.s = DeepMiddle{
            inn: DeepInner{
                a: 10,
                b: false
            },
            c: "hi"
        };
    }
}