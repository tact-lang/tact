struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    c: Bool;
    d: String;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{
                a: 7,
                b: true,
            },
            c: false,
            d: "hello",
        };
    }
}