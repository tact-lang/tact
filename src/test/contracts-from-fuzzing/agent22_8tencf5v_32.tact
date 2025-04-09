// Composite struct with both direct nested composite and optional composite
struct Inner {
    flag: Bool?;
}

struct Middle {
    inner: Inner;
    num: Int;
}

struct Outer {
    m1: Middle?;
    m2: Middle;
    text: String?;
}

contract MixedNestedOptionals {
    store: Outer;

    init() {
        self.store = Outer{
            m1:null,
            m2:Middle{inner:Inner{flag:null},num:5},
            text:null
        };
    }
}