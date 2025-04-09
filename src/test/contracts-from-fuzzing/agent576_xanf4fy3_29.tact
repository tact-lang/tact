struct Inner {
    val: Int;
}

struct Outer {
    inOpt: Inner?;
    flag: Bool = true;
}

contract GetterDeep {
    data: Outer;

    init() {
        self.data = Outer{ inOpt: null };
    }

    get fun getOuter(): Outer {
        return self.data;
    }
}
