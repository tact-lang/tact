struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract ManyNestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            one: Inner{ a:1, b:true },
            two: Inner{ a:2, b:false }
        };
    }
}