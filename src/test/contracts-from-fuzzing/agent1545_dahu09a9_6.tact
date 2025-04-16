struct ManyPrimitives {
    int1: Int; bool1: Bool; string1: String;
    int2: Int; bool2: Bool; string2: String;
    int3: Int; bool3: Bool; string3: String;
    int4: Int; bool4: Bool; string4: String;
}

contract ManyFields {
    lots: ManyPrimitives;

    init() {
        self.lots = ManyPrimitives{
            int1: 1, bool1: true, string1: "1",
            int2: 2, bool2: false, string2: "2",
            int3: 3, bool3: true, string3: "3",
            int4: 4, bool4: false, string4: "4"
        };
    }
}
