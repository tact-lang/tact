struct SSub {
    flag: Bool;
}

struct SMain {
    intVal: Int;
    strVal: String;
    optSSub: SSub?;
}

contract StructOptionalNested {
    x: SMain;
    init() {
        self.x = SMain{
            intVal: 1,
            strVal: "ok",
            optSSub: null
        };
    }
}