struct LayerThree {
    deep: Int?;
}

struct LayerTwo {
    inner: LayerThree?;
    flag: Bool;
}

struct LayerOne {
    middle: LayerTwo?;
    count: Int;
}

contract TestContract {
    field: LayerOne;
    init() {
        self.field = LayerOne{ middle: null, count: 42 };
    }
}
