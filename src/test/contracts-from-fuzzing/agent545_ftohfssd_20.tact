struct MiniNested {
    inner: Inner;
}

struct Inner {
    deep: Deeper;
}

struct Deeper {
    flag: Bool;
    txt: String;
    opt: Int?;
}

contract TestContract {
    track: MiniNested;

    init() {
        self.track = MiniNested{
            inner: Inner{
                deep: Deeper{
                    flag: false,
                    txt: "deepest",
                    opt: null,
                }
            }
        };
    }

    receive() {}
}