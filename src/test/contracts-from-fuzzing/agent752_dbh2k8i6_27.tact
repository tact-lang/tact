struct MidLevel {
    i: Int;
    s: String;
    o: Bool?;
}

struct TopLevel {
    a: Int;
    mid: MidLevel;
}

contract StructNestedOptional {
    t: TopLevel;

    init() {
        self.t = TopLevel{
            a: 42,
            mid: MidLevel{
                i:7,
                s:"hi",
                o:true
            }
        };
    }
}