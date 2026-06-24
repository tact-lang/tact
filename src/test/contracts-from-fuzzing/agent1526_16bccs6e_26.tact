struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Outer {
    x: Inner1?;
    y: Inner2?;
}

contract OptStructsNested {
    o: Outer?;

    init() {
        self.o = null;
    }
}