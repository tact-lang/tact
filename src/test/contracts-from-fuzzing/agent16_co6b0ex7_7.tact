struct DeepDeepInner {
    val: Int;
}

struct DeepMid {
    deep: DeepDeepInner;
}

struct DeepOuter {
    mid: DeepMid;
}

contract VeryDeepNested {
    outer: DeepOuter;

    init() {
        self.outer = DeepOuter{mid: DeepMid{deep: DeepDeepInner{val: 42}}};
    }
}