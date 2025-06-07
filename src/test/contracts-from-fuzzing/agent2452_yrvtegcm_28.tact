struct S1 { v: Int; }

struct Holder {
    innerOpt: S1?;
    inner: S1;
}

contract WeirdOptionalStruct {
    field: Holder;

    init() {
        self.field = Holder{ innerOpt: null, inner: S1{v: 42} };
    }
}