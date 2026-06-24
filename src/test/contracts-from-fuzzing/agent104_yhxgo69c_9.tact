struct NestedMix {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    value: Int;
    opt: Bool?;
}

struct Inner2 {
    txt: String;
    flag: Bool;
}

contract TestContract {
    data: NestedMix;
    init() {
        self.data = NestedMix{
            inner1: Inner1{ value: 10, opt: null },
            inner2: Inner2{ txt: "hello", flag: true }
        };
    }
}