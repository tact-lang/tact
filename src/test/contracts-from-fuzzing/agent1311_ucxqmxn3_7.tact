struct NestedMany {
    i1: Inner;
    i2: Inner;
    i3: Inner;
}

struct Inner {
    n: Int as uint8;
    b: Bool;
    s: String;
}

contract TestContract {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            i1: Inner{n:1,b:true,s:"a"},
            i2: Inner{n:2,b:false,s:"b"},
            i3: Inner{n:3,b:true,s:"c"},
        };
    }
}
