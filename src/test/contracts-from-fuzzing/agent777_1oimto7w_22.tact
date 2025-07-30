struct InnerMost {
    content: String;
}

struct InnerMid {
    field: InnerMost;
}

struct InnerTop {
    val: InnerMid;
}

contract MultiNested {
    d: InnerTop;

    init() {
        self.d = InnerTop{
            val: InnerMid{
                field: InnerMost{
                    content: "deep",
                },
            },
        };
    }
}