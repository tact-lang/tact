struct InnerMost {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Inner {
    im: InnerMost?;
    s: String?;
}

struct Middle {
    inr: Inner?;
    flag: Bool?;
}

struct Outer {
    mdl: Middle?;
    num: Int?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{};  // all nested optionals default to null implicitly
    }
}