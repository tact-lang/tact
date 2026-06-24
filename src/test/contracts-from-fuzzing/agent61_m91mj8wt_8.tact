struct S {
    v: map<Int, Int>;
}

struct WrapperOpt {
    opt: S?;
}

contract Test {
    w: WrapperOpt;
    init() {
        self.w = WrapperOpt{ opt: null };
    }
}