struct InnerMost {
    a: Int;
}
struct Inner {
    i: InnerMost;
}
struct Outer {
    o: Inner;
}
contract NestedDeep {
    x: Outer;
    init() {
        self.x = Outer{ o: Inner{ i: InnerMost{ a: 99 }}};
    }
    receive() {
        let _ = self.x.o.i.a;
    }
}