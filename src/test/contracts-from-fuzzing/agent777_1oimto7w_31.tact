struct DeepStruct {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optStr: String?;
}

struct MiddleStruct {
    inner: DeepStruct;
    optInner: DeepStruct?;
}

contract VeryDeepStructTest {
    data: MiddleStruct;

    init() {
        self.data = MiddleStruct{
            inner: DeepStruct{
                intVal: 10,
                boolVal: true,
                strVal: "hi",
                optInt: null,
                optStr: null,
            },
            optInner: null,
        };
    }
}