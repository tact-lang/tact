struct DeepInner {
    x: Int = 1;
}

struct Middle {
    a: DeepInner;
}

struct Top {
    m: Middle;
}

contract DeeplyNested {
    s: Top = Top{m: Middle{a: DeepInner{x: 42}}};

    receive() {
        self.s = Top{m: Middle{a: DeepInner{x: 99}}};
    }
}