struct Inner {
    a: Int;
}

struct Outer {
    i: Inner;
    x: Bool;
}

contract TestDeepNested {
    o: Outer = Outer{
        i: Inner{ a: 77 },
        x: false
    };
    
    receive() {}
    
    get fun getOuter(): Outer {
         return self.o;
    }
}
