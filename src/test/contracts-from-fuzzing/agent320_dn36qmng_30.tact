struct NestedOpt {
    a: Int?;
}

struct Wrapper {
    b: NestedOpt;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            b: NestedOpt{a:null},
        };
    }
}