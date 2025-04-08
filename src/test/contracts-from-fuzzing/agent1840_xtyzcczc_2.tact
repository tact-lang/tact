struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract DeepNested {
    s: Outer;

    init() {
        self.s = Outer{
            nested: Inner{ a:2, b:true, c:"abc" },
            flag: false
        };
    }
}