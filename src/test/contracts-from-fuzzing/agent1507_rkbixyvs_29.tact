struct Inner {
    val: Int;
}

struct Middle {
    nested: Inner?;
}

struct Outer {
    middle: Middle;
    extra: String;
}

contract OptionalInnerNested {
    o: Outer;

    init() {
        self.o = Outer{
            middle: Middle{
                nested: null
            },
            extra: "done"
        };
    }
}
