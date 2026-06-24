struct InnerMost {
    x: Int;
}
struct Middle {
    im: InnerMost;
}
struct OuterMost {
    mid: Middle;
    count: Int;
    flag: Bool;
}

contract TestContract {
    st: OuterMost;

    init() {
        self.st = OuterMost{
            mid: Middle{
                im: InnerMost{ x: 42 }
            },
            count: 100,
            flag: true
        };
    }
}