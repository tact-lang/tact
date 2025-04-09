struct Deep {
    veryDeep: Int;
}

struct Mid {
    deep: Deep;
}

struct Outer {
    mid: Mid;
}

contract DeeplyNestedStructTest {
    state: Outer;

    init() {
        self.state = Outer { mid: Mid { deep: Deep { veryDeep: 1 } } };
    }
}