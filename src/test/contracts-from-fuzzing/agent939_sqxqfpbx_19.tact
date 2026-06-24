struct Outer {
    a: Inner;
}

struct Inner {
    s: SubInner;
}

struct SubInner {
    i: Int;
    opt: String?;
}

contract TestDeepCombo {
    val: Outer;

    init() {
        self.val = Outer {
            a: Inner {
                s: SubInner {
                    i: 1,
                    opt: null
                }
            }
        };
    }
}