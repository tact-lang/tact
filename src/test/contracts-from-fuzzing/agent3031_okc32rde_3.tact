struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{a: 5, b: null, c: "ok"},
            flag: true,
        };
    }
}