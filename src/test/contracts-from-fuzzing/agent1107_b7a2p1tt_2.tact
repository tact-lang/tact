struct Inner {
    flag: Bool;
    count: Int;
    optionalVal: Int?;
}

struct Outer {
    inner: Inner;
    text: String;
    num: Int;
}

contract NestedStorage {
    store: Outer;
    
    init() {
        self.store = Outer{
            inner: Inner{flag: false, count: 77, optionalVal: null},
            text: "hello",
            num: 5
        };
    }
}