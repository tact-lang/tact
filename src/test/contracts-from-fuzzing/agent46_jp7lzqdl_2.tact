struct InnerMost {
    z: Int?;
}

struct Inner {
    i: Int;
    im: InnerMost;
}

struct Middle {
    m: Inner;
    flag: Bool;
    txt: String;
}

contract DeepNested {
    data: Middle;

    init() {
        self.data = Middle{
            m: Inner{
                i: 10,
                im: InnerMost{z: null},
            },
            flag: false,
            txt: "deep",
        };
    }
}
