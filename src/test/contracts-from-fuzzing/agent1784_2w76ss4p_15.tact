struct Combo {
    nested: NestedOne;
    optString: String?;
    intVal: Int as uint32;
}

struct NestedOne {
    boolFlag: Bool;
    number: Int;
}

contract MixAll {
    combo: Combo;

    init() {
        self.combo = Combo{
            nested: NestedOne{boolFlag:true, number:7},
            optString: "hello",
            intVal: 25
        };
    }
}