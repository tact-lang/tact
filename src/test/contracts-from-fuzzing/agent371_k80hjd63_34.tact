struct IntBoolTuple {
    a:Int;
    b:Bool;
}

struct OuterContainer {
    inner:IntBoolTuple;
}

contract TestContract {
    x: OuterContainer;
    init() {
        self.x = OuterContainer{
            inner: IntBoolTuple{ a:1, b:true }
        };
    }
}
