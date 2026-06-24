struct NestedString {
    s1: String;
    s2: String?;
}

struct MixPrimitives {
    b: Bool;
    i: Int;
    str: NestedString;
}

contract StringMix {
    mp: MixPrimitives;

    init() {
        self.mp = MixPrimitives{
            b: true,
            i: 77,
            str: NestedString{
                s1: "hello",
                s2: null,
            }
        };
    }
}