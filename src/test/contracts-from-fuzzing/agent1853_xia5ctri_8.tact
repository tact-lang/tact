struct Middle {
    a: Int;
    b: String?;
}

struct Outer {
    x: Int;
    m: Middle?;
    y: Int;
}

contract OptionalNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            m: null,
            y: 2
        };
    }
}