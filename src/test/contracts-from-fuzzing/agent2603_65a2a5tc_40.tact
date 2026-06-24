struct NilOpt {
    s: String?;
}

contract NullOptStruct {
    val: NilOpt;

    init() {
        self.val = NilOpt{s:null};
    }
}
