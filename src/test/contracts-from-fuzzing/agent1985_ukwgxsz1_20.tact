struct OuterMost {
    val: Int;
    next: Middle?;
}

struct Middle {
    text: String;
    inner: InnerMost;
}

struct InnerMost {
    flag: Bool;
}

contract ComplexOption {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            val: 10,
            next: Middle{
                text: "hi",
                inner: InnerMost{ flag: true }
            }
        };
    }
}
