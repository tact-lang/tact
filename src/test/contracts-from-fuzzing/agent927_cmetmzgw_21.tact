// deeply nested default values
struct D {
    inner: E;
}

struct E {
    f: Bool = true;
    g: Int = 7;
}

contract DeepDefaults {
    d: D;

    init() {
        self.d = D{
            inner: E{}
        };
    }
}