struct Inner {
    x: Int?;
    y: Bool?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    m: Mid?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            m: Mid{
                inner: Inner{
                    x: null,
                    y: true,
                }
            }
        };
    }
}