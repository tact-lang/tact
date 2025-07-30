struct Inner {
    foo: Int;
}

struct Outer {
    nested: Inner?;
}

contract Test {
    s: Outer?;

    receive() {
        if (self.s != null) {
            let _= self.s!!.nested;
        }
    }
}