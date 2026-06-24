struct A {
    x: Int;
}

struct B {
    inner1: A?;
    inner2: A? = null;
}

struct C {
    part: B? = null;
}

contract BugDefaultOpt {
    val: C;
    init() {
        self.val = C{};
    }
}