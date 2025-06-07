struct DeepMixed {
    a: Int;
    b: Bool?;
    c: Nested;
}

struct Nested {
    d: String;
    e: Bool;
    f: Inner;
}

struct Inner {
    g: Int?;
    h: String;
}

contract MixTest {
    val: DeepMixed;

    init() {
        self.val = DeepMixed{
            a: 1, b: null,
            c: Nested{
                d: "hi",
                e: true,
                f: Inner{
                    g: null,
                    h: "there"
                }
            }
        };
    }
}