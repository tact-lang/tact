struct Inner {
    k: Int = 11;
    l: Bool?;
}

struct Outer {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Inner;
}

contract MixDefaultOptional {
    data: Outer;

    init() {
        self.data = Outer{
            a: 5,
            c: null,
            d: Inner{ l: true }
        };
    }
}