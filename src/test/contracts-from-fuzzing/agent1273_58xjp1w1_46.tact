struct Inner {
    msg: String;
    opt: Int?;
}

contract OptionalInStruct {
    content: Inner;

    init() {
        self.content = Inner{msg:"hi", opt:null};
    }
}