struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    d: Inner?;
    e: Inner?;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            d: Inner{a:1,b:true,c:"x"},
            e: null,
        };
    }
}