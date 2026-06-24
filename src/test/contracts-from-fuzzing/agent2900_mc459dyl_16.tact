struct InnerMost {
    done: Bool;
    note: String;
}

struct Inner {
    flag: Bool;
    val: InnerMost;
}

struct Mid {
    count: Int;
    inners: Inner;
}

contract DeepContract {
    m: Mid;

    init() {
        self.m = Mid{
            count: 5,
            inners: Inner{
                flag: true,
                val: InnerMost{ done:false, note:"txt" },
            },
        };
    }
}
