struct DeepInner {
    value: Int?;
}

struct Middle {
    d: DeepInner;
    flag: Bool;
}

contract OptionalNestedStructField {
    middle: Middle;

    init() {
        self.middle = Middle{
            d: DeepInner{value: null},
            flag: false
        };
    }
}