struct Inner {
    a: Int = 7;
    b: Bool;
}

struct Outer {
    x: Inner;
    str: String;
}

contract NestedDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{ a:8, b:false },
            str: "hello"
        };
    }
}