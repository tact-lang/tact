struct Inner {
    val: Int;
    flag: Bool = true;
    text: String = "inner";
}

struct Outer {
    inside: Inner;
    outerVal: Int;
    optFlag: Bool?;
}

contract OptionalNestedFields {
    data: Outer;

    init() {
        self.data = Outer{
            inside: Inner{ val: 123 },
            outerVal: 456,
            optFlag: null
        };
    }
}