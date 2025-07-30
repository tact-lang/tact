struct Mid {
    v: Int;
    opt: Bool?;
}

contract StructInContract {
    obj: Mid;

    init() {
        self.obj = Mid{v:10, opt:true};
    }
}
