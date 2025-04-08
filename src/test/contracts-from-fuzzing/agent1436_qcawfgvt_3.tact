struct DeepNested {
    s: Inner;
}

struct Inner {
    i: Int;
    f: Bool;
    t: Tiny;
}

struct Tiny {
    flag: Bool;
    name: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s: Inner{
                i: 42,
                f: false,
                t: Tiny{
                    flag: true,
                    name: "deep",
                },
            },
        };
    }
}
