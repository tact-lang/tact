struct Inner {
    x: Int as uint3;
    y: Bool?;
}

struct Middle {
    a: Inner?;
    b: Int as int5;
}

struct OuterMost {
    m: Middle?;
    flag: Bool;
}

contract Test22 {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            m: null,
            flag: true
        };
    }
}