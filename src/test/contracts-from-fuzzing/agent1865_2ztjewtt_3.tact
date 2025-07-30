struct Inner {
    num: Int as int128;
    flag: Bool;
}

struct Wrapper {
    one: Inner;
    two: Inner;
    text: String;
}

contract DeepNested {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            one: Inner{ num: 1, flag: true },
            two: Inner{ num: 2, flag: false },
            text: "deep",
        };
    }
}