struct Inner {
    flag: Bool;
    rest: Slice as remaining;
}

struct Outer {
    count: Int;
    payload: Inner;
}

contract NestedRemaining {
    data: Outer;
    init() {
        self.data = Outer{count:5,payload:Inner{flag:true,rest:emptyCell().asSlice()}};
    }
}