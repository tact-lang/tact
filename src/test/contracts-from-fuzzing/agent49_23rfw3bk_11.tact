struct Inner {
    m: map<Int, Int>;
}

struct Outer {
    inr: Inner;
}

contract TestMapNested2 {
    receive() {
       let inner: Inner = Inner { m: emptyMap() };
       inner.m.set(1, 42);
       let outer: Outer = Outer { inr: inner };
       let val: Int = outer.inr.m.get(1)!!;
       val;
    }
}
