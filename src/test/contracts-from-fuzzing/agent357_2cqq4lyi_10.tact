struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract SameNestedStructs {
    store: Outer;

    init() {
        self.store = Outer{
            a: Inner{ val1:1, val2:true },
            b: Inner{ val1:2, val2:false },
            c: Inner{ val1:3, val2:true },
        };
    }
}