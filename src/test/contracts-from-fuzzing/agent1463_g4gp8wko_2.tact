struct DeepInner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: DeepInner;
    c: String?;
}

struct Top {
    middle: Middle;
    extra: Bool;
    extraStr: String;
}

contract DeepTest {
    payload: Top;

    init() {
        self.payload = Top{
            middle: Middle{
                inner: DeepInner{
                    a: 7,
                    b: true,
                },
                c: null,
            },
            extra: false,
            extraStr: "world",
        };
    }
}
