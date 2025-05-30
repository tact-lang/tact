struct TopMost {
    inner: MidLevel?;
}

struct MidLevel {
    a: Int?;
}

contract OptionalRecursion {
    nesting: TopMost;

    init() {
        self.nesting = TopMost{
            inner: null
        };
    }
}
