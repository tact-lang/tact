struct NestedInner {
    f: Int?;
}
struct MiddleOpt {
    f: NestedInner?;
}
struct OuterOpt {
    f: MiddleOpt?;
}

contract DeepOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            f: MiddleOpt{
                f: NestedInner{
                    f: 42
                }
            }
        };
    }
}