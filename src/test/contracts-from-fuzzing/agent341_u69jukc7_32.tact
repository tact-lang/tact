struct Outmost {
    nested: Mid;
}

struct Mid {
    inner: InnerOne;
}

struct InnerOne {
    deep: VeryInner;
}

struct VeryInner {
    f: Int;
}

contract TestContract {
    s: Outmost;

    init() {
        self.s = Outmost{
            nested: Mid {
                inner: InnerOne {
                    deep: VeryInner{
                        f: 777
                    }
                }
            }
        };
    }
}