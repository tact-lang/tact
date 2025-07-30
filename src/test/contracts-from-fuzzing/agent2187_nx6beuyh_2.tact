struct Inner { a: Int; b: Int; }

struct Outer { inner: Inner; c: Int; }

contract TestNested {
    val: Outer;

    init() {
        self.val = Outer{inner: Inner{a:1, b:2}, c:3};
    }
}