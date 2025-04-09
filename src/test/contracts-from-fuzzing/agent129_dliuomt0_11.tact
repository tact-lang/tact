// test large nested optional/nullable hierarchy inside a large struct
struct InnerMost {
    p: Int?;
    q: Bool?;
    s: String?;
}

struct Middle {
    im: InnerMost?;
    t: String?;
}

struct Outer {
    m1: Middle?;
    m2: Middle?;
}

contract BigNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            m1: null,
            m2: null,
        };
    }
}
