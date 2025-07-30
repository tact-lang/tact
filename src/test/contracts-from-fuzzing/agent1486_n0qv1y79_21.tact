struct InnerD {
    x: Int = 5;
    y: Bool = false;
    z: String = "abc";
}

struct OuterD {
    id: Int;
    inside: InnerD;
}

contract PartialOverrideDefaults {
    content: OuterD;

    init() {
        self.content = OuterD{
            id: 123,
            inside: InnerD{
                y: true,
            },
        };
    }
}