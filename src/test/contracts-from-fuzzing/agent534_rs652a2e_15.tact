struct DoublyNested {
    s1: Inner;
    s2: Inner;
}

struct Inner {
    v1: Int;
    v2: Bool;
}

contract DoublyNestedContract {
    pair: DoublyNested;

    init() {
        self.pair = DoublyNested{
            s1: Inner{v1:1,v2:true},
            s2: Inner{v1:2,v2:false},
        };
    }
}