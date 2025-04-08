struct Inner {
    flag: Bool;
    num: Int;
}

struct Wrapper {
    nested1: Inner;
    nested2: Inner;
}

contract NestedStructs {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested1: Inner{ flag: true, num: 1 },
            nested2: Inner{ flag: false, num: 2 }
        };
    }
}