struct Inner {
    val1: Int;
    val2: Bool;
    val3: String?;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ val1:1, val2:true, val3:null },
            nested2: Inner{ val1:2, val2:false, val3:"foo" },
            nested3: Inner{ val1:3, val2:true, val3:null },
        };
    }
}