struct Outer {
    inner: Inner;
}

struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    o: Outer;
    
    init() {
        self.o = Outer{ inner: Inner{ a: 2, b: "abc", c: true } };
    }
}