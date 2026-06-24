struct Inner {
    intVal: Int;
    boolVal: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract TestContract {
    nestedStruct: Outer;

    init() {
        self.nestedStruct = Outer{
            inner1: Inner{ intVal: 1, boolVal: true },
            inner2: Inner{ intVal: 2, boolVal: false },
            inner3: Inner{ intVal: 3, boolVal: true }
        };
    }
}