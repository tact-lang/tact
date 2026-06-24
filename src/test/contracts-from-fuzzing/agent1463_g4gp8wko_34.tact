struct Inner {
    s: String;
}

contract StringInStruct {
    rec: Inner;

    init() {
        self.rec = Inner{s: "nested"};
    }
}
