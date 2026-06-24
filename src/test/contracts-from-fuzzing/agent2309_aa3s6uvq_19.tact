struct Embed {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract EmbedTest {
    e: Embed;

    init() {
        self.e = Embed{
            intVal: 1,
            boolVal: true,
            stringVal: "hi",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}