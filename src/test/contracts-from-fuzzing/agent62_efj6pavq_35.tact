struct InnerMost {
    a: Int;
}
struct Mid {
    inner: InnerMost;
}
struct Outer {
    mid: Mid;
}

contract ChainNestedStorage {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Mid{
                inner: InnerMost{ a:5 }
            }
        };
    }
}