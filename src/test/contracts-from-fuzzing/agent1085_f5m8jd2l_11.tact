struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
    c: String;
}

struct Outer {
    inner1: Inner1;
    inner2: Inner2;
}

contract NestedStructsFlatVars {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner1{ a: 5 },
            inner2: Inner2{ b: false, c: "str" }
        };
    }
}