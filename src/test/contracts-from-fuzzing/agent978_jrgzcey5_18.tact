// struct with deeply nested and optional string fields
struct Inner {
    x: String?;
    y: String;
}

struct Outer {
    i: Inner?;
    fixed: String;
}

contract OptionalStringNest {
    o: Outer;

    init() {
        self.o = Outer{
            i: null,
            fixed: "hi"
        };
    }
}