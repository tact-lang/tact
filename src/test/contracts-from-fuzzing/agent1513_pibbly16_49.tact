struct NilWrap {
    x: Int?;
}

contract NilInit {
    w: NilWrap;

    init() {
        self.w = NilWrap{x:null};
    }
}