struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    optInt: Int?;
    subInner: SubInner;
}

struct SubInner {
    val: Int;
    maybeVal: Int?;
    deep: DeepSubInner;
}

struct DeepSubInner {
    someFlag: Bool?;
    number: Int;
}

contract TestContract {
    bigNested: Nested;

    init() {
        self.bigNested = Nested{
            inner: Inner{
                flag: false,
                optInt: null,
                subInner: SubInner{
                    val: 1,
                    maybeVal: null,
                    deep: DeepSubInner{
                        someFlag: true,
                        number: 999
                    }
                }
            }
        };
    }
}