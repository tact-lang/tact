struct NestedOpt {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: Inner{ x:42, y:true }
        };
    }
}