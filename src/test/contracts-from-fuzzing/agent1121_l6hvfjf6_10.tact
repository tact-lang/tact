struct Innermost { val: Int }
struct Inner {
    nested: Innermost;
    nestedOpt: Innermost?;
}
struct Outer {
    f: Inner;
}

contract OptionalDeepNest {
    o: Outer;

    init() {
        self.o = Outer{f: Inner{nested: Innermost{val:1}, nestedOpt: null}};
    }
}