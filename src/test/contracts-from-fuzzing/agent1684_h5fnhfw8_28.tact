struct Inner { val: Int = 1; }

struct Outer {
    innerOpt: Inner? = null;
}

contract OptStructInStructPersistent {
    s: Outer = Outer{ innerOpt: null };
}