struct InnerMost {
    val: Int?;
}
struct Middle {
    inner: InnerMost;
}
struct OuterMost {
    mid: Middle;
}

contract NestedOptionals {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{
                inner: InnerMost{ val: null }
            }
        };
    }
}