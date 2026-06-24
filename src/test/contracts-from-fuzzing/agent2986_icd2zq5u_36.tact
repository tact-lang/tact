// test contract that combines nested struct, optionals, default values
struct Inner {
    A: Int?;
    B: Bool = true;
    C: String = "test";
}

contract MixAll {
    f: Inner?;

    init() {
        self.f = null;
    }
}