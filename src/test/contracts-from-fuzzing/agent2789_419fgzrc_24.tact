struct LayerOne {
    level: Int;
    label: String;
}

struct LayerTwo {
    inner: LayerOne;
    flag: Bool;
}

struct LayerThree {
    deeper: LayerTwo;
    opt: Int?;
}

contract MultiNestedVariants {
    n: LayerThree;

    init() {
        self.n = LayerThree{
            deeper: LayerTwo{
                inner: LayerOne{
                    level: 1,
                    label: "hi"
                },
                flag: true
            },
            opt: null
        };
    }
}
