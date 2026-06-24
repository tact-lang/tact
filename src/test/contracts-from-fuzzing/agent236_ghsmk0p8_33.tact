message(777) M { val: Int as uint16; txt: String }

struct S {
    maybeNum: Int?;
    serializedInt: Int as uint8;
    unicodeText: String = "こんにちは";
    embeddedMsg: M;
}

contract TestContract {
    num: Int = 5;
    optBool: Bool? = null;
    sfield: S;

    init() {
        self.num = 42;
        self.optBool = true;
        self.sfield = S{
            maybeNum: null,
            serializedInt:7,
            unicodeText:"안녕",
            embeddedMsg:M{val:300,txt:"👋"}
        };
    }
}