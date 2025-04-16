struct Inner { x: Int; }

struct Outer {
    nested: Inner? = null;
}

contract BugTest {
    v: Outer;
    init() {self.v = Outer{ nested: null };}
}