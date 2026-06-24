struct Inner {
    s: String;
}

struct Outer {
    a: Int;
    b: Bool;
    c: String;
    d: Inner?;
}

contract OptionalStruct {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: 1,
            b: true,
            c: "str",
            d: null,
        };
    }
}