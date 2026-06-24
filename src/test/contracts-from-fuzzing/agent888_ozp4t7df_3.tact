struct Inner {
    x: Int?;
    y: String;
}

struct Mid {
    inner: Inner;
    flag: Bool?;
}

struct Top {
    mid: Mid;
    data: String?;
}

contract DeepNested {
    persist: Top;

    init() {
        self.persist = Top{
            mid: Mid{
                inner: Inner{
                    x: null,
                    y: "deep",
                },
                flag: null,
            },
            data: null,
        };
    }
}