struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract ComplexOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{ val: 42 },
            flag: false
        };
    }
}