struct SubX {
    xx: Int;
    yy: String;
}

struct MidX {
    first: SubX;
    second: SubX;
}

struct OuterX {
    middle: MidX;
    number: Int;
    flag: Bool;
}

contract MultiNest {
    storage: OuterX;
    init() {
        self.storage = OuterX{
            middle: MidX{
                first: SubX{xx:1, yy:"a"},
                second: SubX{xx:2, yy:"b"}
            },
            number: 42,
            flag: true
        };
    }
}