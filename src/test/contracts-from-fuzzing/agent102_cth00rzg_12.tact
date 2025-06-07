struct OptionalInNested {
    n: Nested?;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract OptionalOfStruct {
    f: OptionalInNested;

    init() {
        self.f = OptionalInNested{
            n: Nested{ x: 100, y: false }
        };
    }
}