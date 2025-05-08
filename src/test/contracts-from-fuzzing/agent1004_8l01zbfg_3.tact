struct Inner {
    val: Int;
}

struct Outer {
    innerStruct: Inner;
    boolVal: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerStruct: Inner{ val: 1 },
            boolVal: true
        };
    }
}