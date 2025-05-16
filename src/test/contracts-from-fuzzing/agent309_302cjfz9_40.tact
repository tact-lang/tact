struct ComposeOpt {
    inner: InnerOptStruct?;
}

struct InnerOptStruct {
    foo: Int?;
    txt: String;
}

contract ComposeOptTest {
    val: ComposeOpt;

    init() {
        self.val = ComposeOpt{
            inner: InnerOptStruct{ foo: null, txt:"hey" }
        };
    }
}