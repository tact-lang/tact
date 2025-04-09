struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Outer {
    nested: Inner;
    num: Int;
    opt: Bool?;
}

contract StructInStruct {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                a: 1,
                b: true,
                c: null,
            },
            num: 77,
            opt: false,
        };
    }
}