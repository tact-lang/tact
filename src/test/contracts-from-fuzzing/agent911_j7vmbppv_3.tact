struct InnerMost {
    value1: Int;
    value2: String;
    flag: Bool?;
}

struct Middle {
    maybeInner: InnerMost?;
    b: Bool;
}

struct Outer {
    id: Int;
    nested: Middle;
}

contract DeepStructFields {
    data: Outer;

    init() {
        self.data = Outer{
            id: 1,
            nested: Middle{
                maybeInner: null,
                b: true
            }
        };
    }
}