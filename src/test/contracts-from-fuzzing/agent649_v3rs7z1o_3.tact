struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    count: Int;
}

struct Outer {
    middle: Middle;
    enabled: Bool;
}

contract DeepNestedStruct {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: Inner{
                    a: 1,
                    b: true
                },
                count: 2
            },
            enabled: false
        };
    }
}