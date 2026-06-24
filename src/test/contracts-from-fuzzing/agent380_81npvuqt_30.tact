struct DeeplyNested {
    a: Int;
}

struct Wrap1 {
    inner: DeeplyNested;
}

struct Wrap2 {
    wrap1: Wrap1;
}

struct Wrap3 {
    wrap2: Wrap2;
}

contract DeepRecursion {
    state: Wrap3;

    init() {
        self.state = Wrap3{ wrap2: Wrap2{ wrap1: Wrap1{ inner: DeeplyNested{ a:5 } } } };
    }
}