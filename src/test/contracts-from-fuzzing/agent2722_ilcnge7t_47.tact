// mixing defaults in deeply nested struct

struct Bottom {
    k: Int = 7;
    q: Bool;
}

struct Middle {
    inner: Bottom;
    text: String = "z";
}

contract DeepMixedDefaults {
    m: Middle;

    init() {
        self.m = Middle {
            inner: Bottom { q:true },
            text: "hello"
        };
    }
}