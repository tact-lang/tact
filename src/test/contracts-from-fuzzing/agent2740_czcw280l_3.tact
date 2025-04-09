struct Inner {
    intField: Int = 1;
    boolField: Bool = true;
}

struct Outer {
    optStruct: Inner?;
    someInt: Int;
}

contract OptionalStructTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            optStruct: Inner{ intField: 42, boolField: false },
            someInt: 99
        };
    }
}