struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Mix {
    f1: Inner1?;
    f2: Inner2?;
}

contract NestedOptionalMix {
    complex: Mix;

    init() {
        self.complex = Mix{
            f1: null,
            f2: null
        };
    }
}