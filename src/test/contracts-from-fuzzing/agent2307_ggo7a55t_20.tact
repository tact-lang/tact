struct WrapStr {
    val: String;
}

struct Outer {
    w: WrapStr;
    txt: String;
    f: Bool;
}

contract ManyStrings {
    store: Outer;

    init() {
        self.store = Outer{
            w: WrapStr{val: "abc"},
            txt: "xyz",
            f: true
        };
    }
}
