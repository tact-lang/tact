struct SOptRef {
    a: Int;
    b: RefOpt?;
}

struct RefOpt {
    foo: Int;
    bar: Bool;
}

contract TestOptRef {
    s: SOptRef;

    init() {
        self.s = SOptRef{
            a:42,
            b:null
        };
    }
}