struct InnerMost {
    deep: Int?;
    flag: Bool = true;
}

struct Middle {
    x: Int as uint32;
    y: InnerMost;
}

struct Outer {
    m: Middle;
    n: Int = 7;
}

contract BigContract {
    data: Outer;
    init() {
        self.data = Outer{ m: Middle{ x: 123456, y: InnerMost{} } };
    }
}