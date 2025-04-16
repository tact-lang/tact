struct FullNested {
    inner: InnerNested;
}

struct InnerNested {
    innermost: Innermost;
}

struct Innermost {
    value: Int;
}

contract FullDeepNesting {
    f: FullNested;
    init() {
        self.f = FullNested {
            inner: InnerNested {
                innermost: Innermost { value: 999 }
            }
        };
    }
}