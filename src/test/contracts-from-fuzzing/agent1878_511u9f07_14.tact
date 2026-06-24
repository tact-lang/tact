struct Inner {
    text: String;
}

struct Outer {
    inr: Inner;
}

contract Test {
    huge: Outer;

    init() {
        self.huge = Outer{
            inr: Inner{ text: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" }
        };
    }
}