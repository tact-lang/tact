contract EmptyOptionalStruct {
    opt: Empty?;

    init() {
        self.opt = null;
    }
}

struct Empty { x: Int; }
