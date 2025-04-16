struct InnerStr {
    txt: String;
}

contract StringNest {
    i1: InnerStr;
    i2: InnerStr;
    init() {
        self.i1 = InnerStr{ txt: "hello" };
        self.i2 = InnerStr{ txt: "world" };
    }
}