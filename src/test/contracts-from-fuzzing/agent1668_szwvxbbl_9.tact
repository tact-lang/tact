struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    nested: Inner;
    optNested: Inner?;
}

struct Inner {
    flag: Bool;
    val: Int;
}

contract ComboTest {
    combo: Combo;
    init() {
        self.combo = Combo{
            intVal: 10,
            boolVal: false,
            strVal: "hi",
            nested: Inner{ flag: true, val: 5 },
            optNested: null
        };
    }
}