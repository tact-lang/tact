struct SDepth4 {
    f: Int;
}

struct SDepth3 {
    s: SDepth4;
}

struct SDepth2 {
    s: SDepth3;
}

struct SDepth1 {
    s: SDepth2;
}

contract Depth4 {
    deep: SDepth1;

    init() {
        self.deep = SDepth1{ s: SDepth2{ s: SDepth3{ s: SDepth4{ f: 1 } } } };
    }
}