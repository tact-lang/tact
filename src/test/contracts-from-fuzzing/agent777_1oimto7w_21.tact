struct OptNested {
    in1: Int?;
    str1: String?;
}

struct OptOuter {
    nested: OptNested?;
    in2: Int;
    str2: String;
}

contract OptionalLevelTest {
    data: OptOuter;

    init() {
        self.data = OptOuter{
            nested: OptNested{
                in1: null,
                str1: "zz",
            },
            in2: 77,
            str2: "yy",
        };
    }
}