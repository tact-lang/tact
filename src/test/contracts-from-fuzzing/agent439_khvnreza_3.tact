struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

struct Outer {
    inner: Inner;
    s: String;
    n: Int?;
}

contract Test3 {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{a: 1, b: true, c: myAddress()},
            s: "test",
            n: null,
        };
    }

    receive() {}
}