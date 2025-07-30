struct InnerMost {
    intVal: Int;
}

struct MiddleA {
    inner: InnerMost;
}

struct MiddleB {
    middleA: MiddleA;
}

struct Outer {
    middleB: MiddleB;
}

contract DeepChainTest {
    deep: Outer;

    init() {
        self.deep = Outer{
            middleB: MiddleB{middleA: MiddleA{inner: InnerMost{intVal: 99}}}
        };
    }
}