struct Inner { i:Int; }
struct Outer { inner:Inner; }

contract TopInner {
    top: Outer;

    init() {
        self.top = Outer{ inner: Inner{ i: 5 } };
    }
}