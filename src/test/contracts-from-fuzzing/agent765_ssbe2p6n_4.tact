struct Inner {
    value1: Int = 5;
    value2: Bool = true;
    optStr: String?;
}

struct Outer {
    nested: Inner;
    flag: Bool = false;
    number: Int = 88;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{value1: 10, value2: false, optStr: null},
            flag: true,
            number: 123
        };
    }
}