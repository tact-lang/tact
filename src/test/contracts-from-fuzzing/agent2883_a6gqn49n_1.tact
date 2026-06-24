struct Inner {
    small: Int as uint8;
    optStr: String?;
}

struct Outer {
    num: Int;
    nested: Inner;
    flag: Bool;
}

contract NestedStructContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            num: 12345,
            nested: Inner{
                small: 1,
                optStr: null
            },
            flag: true
        };
    }
}