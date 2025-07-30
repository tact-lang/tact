struct Deep {
    a: Int;
    b: Int?;
}

struct Middle {
    d: Deep;
    num: Int;
}

contract NestedStructsOptional {
    m: Middle;

    init() {
        self.m = Middle{ d: Deep{ a: 2, b: null }, num: 9 };
    }
}