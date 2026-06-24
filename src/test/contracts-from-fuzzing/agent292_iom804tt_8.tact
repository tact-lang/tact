struct NestedOpt {
    a: Int?;
    b: Bool?;
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptContract {
    field: NestedOpt;

    init() {
        self.field = NestedOpt{
            a:null,
            b:true,
            inner:Inner{val:42}
        };
    }
}