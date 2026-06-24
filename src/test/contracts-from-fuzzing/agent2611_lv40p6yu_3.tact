struct DeepInner {
    flag: Bool;
}

struct Middle {
    maybeInner: DeepInner?;
    id: Int;
}

struct Outer {
    mid: Middle;
    label: String;
}

contract DeepNestTest {
    bigStruct: Outer;

    init() {
        self.bigStruct = Outer{
            mid: Middle{
                maybeInner: null,
                id: 99
            },
            label: "label"
        };
    }
}