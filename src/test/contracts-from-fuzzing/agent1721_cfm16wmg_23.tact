struct OuterMost {
    x: InnerMost?;
}
struct InnerMost {
    a: Int;
    b: Bool;
}

contract DeepOption {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            x: InnerMost{
                a: 88,
                b: true
            }
        };
    }
}