struct Inner {
    flag: Bool;
    message: String;
}

struct Middle {
    number: Int;
    inner: Inner;
}

struct Outer {
    outerFlag: Bool;
    middle: Middle;
}

contract DeepNestedStructsStorage {
    record: Outer;

    init() {
        self.record = Outer{
            outerFlag: true,
            middle: Middle{
                number: 42,
                inner: Inner{
                    flag: false,
                    message: "nested"
                }
            }
        };
    }
}