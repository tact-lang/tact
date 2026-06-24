struct Outer {
    nested: Middle;
}

struct Middle {
    deep: Inner;
}

struct Inner {
    deeplyOpt: Int?;
    deeplyFlag: Bool?;
    deeplyString: String?;
}

contract UltraDeep {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Middle{
                deep: Inner{
                    deeplyOpt: null,
                    deeplyFlag: false,
                    deeplyString: "deep"
                }
            }
        };
    }
}