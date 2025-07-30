// a contract with a mix of optional and non optional nested struct fields
struct InnerMost {
    val: Int;
    optVal: Bool?;
}

struct Middle {
    inner: InnerMost?;
    flag: Bool;
}

contract MixedNested {
    storage: Middle;

    init() {
        self.storage = Middle{
            inner: InnerMost{ val: 5, optVal: null },
            flag: true
        };
    }
}