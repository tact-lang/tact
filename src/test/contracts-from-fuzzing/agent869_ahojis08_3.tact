struct InnerMost {
    foo: Int;
}

struct Mid {
    im: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract TestContract {
    deeplyNested: Outer;

    init() {
        self.deeplyNested = Outer{
            mid: Mid{
                im: InnerMost{
                    foo: 777
                }
            }
        };
    }
}