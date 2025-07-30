struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost;
    data: Int;
}

struct OuterMost {
    mid: Mid;
    flag: Bool;
}

contract Layered {
    info: OuterMost;

    init() {
        self.info = OuterMost{
            mid: Mid{
                inner: InnerMost{ val:42 },
                data: 7
            },
            flag: true
        };
    }
}