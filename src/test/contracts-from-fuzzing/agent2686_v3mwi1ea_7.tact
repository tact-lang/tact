struct LargeMix {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract BigMixTest {
    data: LargeMix;

    init() {
        self.data = LargeMix{
            intVal: 77,
            boolVal: true,
            stringVal: "abc",
            optInt: null,
            optBool: false,
            optString: "maybe"
        };
    }
}
