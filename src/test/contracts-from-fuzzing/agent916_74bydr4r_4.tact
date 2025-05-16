struct Inner {
    text: String?;
    num: Int;
}

struct Outer {
    innerData: Inner?;
    flag: Bool;
}

contract Test {
    saved: Outer;

    init() {
        self.saved = Outer{
            innerData: null,
            flag: true,
        };
    }
}