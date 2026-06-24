struct Inner { a: Int; b: Int = 5; }
struct Outer { inner: Inner; c: Int = 10; }

contract TestNestedDestructureUnderscore {
    receive() {
        let o: Outer = Outer{ inner: Inner{ a: 100 }, c: 10 };
        let Outer { inner: _, c } = o;
        c; // should be 10
    }
}
