struct InnerOpt {
    x: Int?;
    y: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract NestedOptionals {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{
            inner: InnerOpt{
                x: 10,
                y: null
            },
            flag: true,
        };
    }
}
