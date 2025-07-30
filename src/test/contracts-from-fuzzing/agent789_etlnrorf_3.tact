struct DeepInner {
    deepVal: Bool;
}

struct Middle {
    middleVal: DeepInner;
}

struct Outer {
    outerVal: Middle;
}

contract DeepNestedTest {
    x: Outer;
    init() {
        self.x = Outer{
            outerVal: Middle{
                middleVal: DeepInner{
                    deepVal: false
                }
            }
        };
    }
}