struct Outer {
    inner: Middle;
}

struct Middle {
    inner: InnerMost;
}

struct InnerMost {
    info: String;
    flag: Bool;
    num: Int;
}

contract DeepStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Middle{
                inner: InnerMost{
                    info: "deep",
                    flag: true,
                    num: -12345
                }
            }
        };
    }
}