struct MixTypes {
    intVal: Int = 13;
    boolVal: Bool = false;
    strVal: String = "yo";
    optInt: Int? = null;
    optBool: Bool? = true;
    optStr: String? = null;
}

contract HodgePodge {
    m: MixTypes = MixTypes{};

    init() {
        self.m = MixTypes{
            intVal: 1000,
            boolVal: true,
            strVal: "hello",
            optInt: 12345,
            optBool: false,
            optStr: "bye"
        };
    }
}