struct DeepNested {
    inner1: Int;
    inner2: Bool;
}

struct Middle {
    middleVal: DeepNested;
    optionalNested: DeepNested?;
}

struct Outer {
    m1: Middle;
    m2: Middle?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            m1: Middle{middleVal: DeepNested{inner1: 13, inner2: false}, optionalNested: null},
            m2: null
        };
    }
}