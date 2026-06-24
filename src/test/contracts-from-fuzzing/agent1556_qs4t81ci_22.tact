// optional struct containing remaining field
struct Inner {
    pre: Int = 123;
    rest: Slice as remaining;
}

struct Outer {
    foo: Int = 55;
    opt: Inner?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{foo:42, opt: Inner{pre:7, rest: emptyCell().asSlice()}};
    }

    receive() {
        let _ = self.s.foo;
        let _ = self.s.opt;
    }
}