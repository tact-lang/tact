struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNested {
    state: Outer;
    
    init() {
        self.state = Outer { inner: Inner { val: 99 }, flag: false };
    }
    
    receive() {}
    
    get fun getOuter(): Outer {
         return self.state;
    }
}
