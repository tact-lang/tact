// test optional struct nested inside an optional struct (non-nested optionals!), complex nesting
struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    i: Inner?;
    s: String;
}

struct Outer {
    m: Middle?;
    flag: Bool;
}

contract OptionalNestedStruct {
    o: Outer;

    init() {
        self.o = Outer{
            m: null,
            flag: true
        };
    }
}