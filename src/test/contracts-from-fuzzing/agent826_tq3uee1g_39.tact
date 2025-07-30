struct Inner {
    foo: Int;
}

struct Mid {
    bar: Inner;
    baz: Int;
}

struct Outer {
    mid: Mid;
    flag: Bool;
}

contract NestedStructCombo {
    value: Outer;
    init() {
        self.value = Outer{
            mid: Mid{
                bar: Inner{foo:42},
                baz: 7
            },
            flag:true
        };
    }
}