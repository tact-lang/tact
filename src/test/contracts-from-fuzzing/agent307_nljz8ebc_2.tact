struct Inner {
    x: Int;
    y: Bool = false;
    z: String = "hello";
}

struct Outer {
    a: Int = 1;
    b: String;
    c: Inner;
    d: Bool?;
    e: String?;
}

contract Test {
    outer: Outer;
    
    init() {
        self.outer = Outer{
            b: "world",
            c: Inner{
                x: 5
            },
            d: true,
            e: null,
        };
    }
}