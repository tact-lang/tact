struct NestedDefaults {
    nx: Int = 100;
    ny: Bool = true;
}

struct NestedOptional {
    oz: String?;
}

struct MixAll {
    a: Int = 0;
    b: Bool?;
    c: String?;
    d: NestedDefaults;
    e: NestedOptional;
}

contract MixDefaultOptNest {
    val: MixAll;

    init() {
        self.val = MixAll{
            b: true,
            c: null,
            d: NestedDefaults{},
            e: NestedOptional{ oz: "hi" }
        };
    }
}