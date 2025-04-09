struct GenericBoolWrap {
    b: Bool;
}

contract TestContract {
    a: Bool = false;
    b: Bool? = null;
    g: GenericBoolWrap = GenericBoolWrap{b: true};
    g_opt: GenericBoolWrap? = null;

    init() {
        self.a = true;
        self.b = true;
        self.g_opt = GenericBoolWrap{b:false};
    }
}