struct InnerInner {
    yy: String;
}

struct Inner {
    y: InnerInner;
}

struct Outer {
    x: Inner;
}

contract DeepLevelsContract {
    deep: Outer;

    init() {
        self.deep = Outer{
            x: Inner{
                y: InnerInner{
                    yy: "deep"
                }
            }
        };
    }
}