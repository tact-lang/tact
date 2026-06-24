struct DefaultNested {
    x: Int = 1;
    y: Bool = true;
    s: String = "hi";
}

struct DefaultOuter {
    a: Int;
    b: DefaultNested;
}

contract DefaultsContract {
    d: DefaultOuter;

    init() {
        self.d = DefaultOuter{
            a: 10,
            b: DefaultNested{},
        };
    }
}