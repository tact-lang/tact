struct Inner {
    flag: Bool;
    num: Int;
}

struct Outer {
    inner: Inner;
    value: Int;
    status: Bool;
}

contract Test {
    record: Outer;
    
    init() {
        self.record = Outer{
            inner: Inner{flag: false, num: 42},
            value: 100,
            status: true
        };
    }
}