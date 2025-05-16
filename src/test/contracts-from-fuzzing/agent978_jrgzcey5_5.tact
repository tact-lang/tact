struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    c: String;
    d: InnerMost?;
}

struct Outer {
    e: Middle;
    f: Int?;
}

contract NestedOptionalStruct {
    o: Outer;

    init() {
        self.o = Outer{
            e: Middle{
                c: "hello",
                d: null
            },
            f: null
        };
    }
}