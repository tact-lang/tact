struct DeepNested {
    num: Int;
    innerBool: Bool;
}

struct Middle {
    deep: DeepNested;
    middleVal: Int;
}

struct Outer {
    mid: Middle;
    anotherFlag: Bool;
}

contract TestContract {
    composite: Outer;

    init() {
        self.composite = Outer{
            mid: Middle{
                deep: DeepNested{ num: 88, innerBool: true },
                middleVal: 17
            },
            anotherFlag: false
        };
    }
}