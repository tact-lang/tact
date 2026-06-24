struct OptWrap {
    inner: Int?;
}

contract DeepOptWrap {
    a: OptWrap;
    b: OptWrap;

    init() {
        self.a = OptWrap{inner:null};
        self.b = OptWrap{inner:null};
    }
}