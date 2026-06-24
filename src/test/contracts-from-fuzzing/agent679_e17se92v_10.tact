struct Inner {
    small: Int as uint8 = 7;
    flag: Bool = true;
}

struct Outer {
    nested: Inner;
    num: Int as int64 = 42;
}

contract TestContract {
    data: Outer = Outer{
        nested: Inner{small: 7, flag: true},
        num: 42
    };
}