struct Deep {
    a: Int;
}

struct Middle {
    deep: Deep;
}

struct Outer {
    middle: Middle;
}

contract DeeplyNestedStruct {
    outer: Outer;

    init() {
        self.outer = Outer{middle: Middle{deep: Deep{a:1}}};
    }
}