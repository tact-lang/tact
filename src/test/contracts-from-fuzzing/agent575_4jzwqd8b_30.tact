struct NestedOpt {
    inner: S;
}

struct S {
    val: Int?;
    flag: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: S{ val:null, flag:true }
        };
    }
}
