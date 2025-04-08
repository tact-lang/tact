struct InnerMost {
    a: Int;
}
struct Inner {
    i: InnerMost;
}
struct OuterMost {
    o: Inner;
}

contract TestContract {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            o: Inner{
                i: InnerMost{ a: 123 }
            }
        };
    }
}