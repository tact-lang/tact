struct NestedOpt {
    innerOpt: Inner?;
}

struct Inner {
    v: Int;
    b: Bool;
    s: String?;
}

contract TestContract {
    no: NestedOpt;

    init() {
        self.no = NestedOpt{
            innerOpt: Inner{v:7, b:true, s:null}
        };
    }
}