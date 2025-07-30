struct Inner {
    val: Int;
}

struct Outer {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    s4: Inner;
    s5: Inner;
}

contract ManyNestedSameStruct {
    root: Outer;

    init() {
        self.root = Outer{
            s1: Inner{ val:1 },
            s2: Inner{ val:2 },
            s3: Inner{ val:3 },
            s4: Inner{ val:4 },
            s5: Inner{ val:5 }
        };
    }
}