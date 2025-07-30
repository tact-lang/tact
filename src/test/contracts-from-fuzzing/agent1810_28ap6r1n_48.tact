struct ComplexNesting {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: String?;
}

struct WrapOnce {
    inner: ComplexNesting;
}

struct WrapTwice {
    inner: WrapOnce;
}

struct WrapThrice {
    inner: WrapTwice;
}

contract DeepWrapContract {
    root: WrapThrice;
    init() {
        self.root = WrapThrice{
            inner: WrapTwice{
                inner: WrapOnce{
                    inner: ComplexNesting{
                        f1:1, f2:null, f3:"abc", f4:null
                    }
                }
            }
        };
    }
}