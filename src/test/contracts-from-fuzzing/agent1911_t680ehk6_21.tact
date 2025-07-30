struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    nestedOpt: InnerMix?;
}

struct InnerMix {
    flag: Bool;
    num: Int;
}

contract FinalMixTest {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 5,
            boolVal: true,
            strVal: "mixed",
            nestedOpt: null
        };
    }
}