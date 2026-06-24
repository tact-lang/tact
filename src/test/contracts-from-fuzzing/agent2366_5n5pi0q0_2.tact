struct DeepNested {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Int;
    deep: DeepNested;
}

contract TestContract {
    middleField: Middle;

    init() {
        self.middleField = Middle{x: 5, deep: DeepNested{a: 42, b: false}};
    }
}