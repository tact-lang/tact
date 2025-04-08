struct Outer {
    a: Int;  
    nested: Inner;
}

struct Inner {
    b: Int?;
    c: Bool;
    d: Address?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            a: 42,
            nested: Inner{
                b: 7,
                c: false,
                d: null,
            }
        };
    }

    receive() {
        let _ = self.o.a;
        let _ = self.o.nested.b;
        let _ = self.o.nested.c;
        let _ = self.o.nested.d;
    }
}