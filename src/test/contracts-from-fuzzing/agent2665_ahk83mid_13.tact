struct S {
    x: Int;
}

struct VeryNested {
    s1: S?;
    s2: S?;
}

struct Outer {
    inner: VeryNested?;
}

contract OptDeeplyNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}