struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner?;
    s: String;
    flag: Bool;
}

contract NullableNested {
    field: Outer;

    init() {
        self.field = Outer{
            inner1: Inner{a:5, b:true},
            inner2: null,
            s: "test",
            flag: false
        };
    }
}
