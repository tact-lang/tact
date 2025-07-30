struct DeepInner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: DeepInner;
    flag: Bool;
}

contract DeepNestContract {
    content: Middle;

    init() {
        self.content = Middle{
            inner: DeepInner{
                a: 10,
                b: false,
            },
            flag: true,
        };
    }
}