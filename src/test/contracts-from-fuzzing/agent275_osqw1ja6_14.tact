struct Inner {
    x: Int;
}

struct Outer {
    a: Int;
    b: Bool;
    c: String;
    d: Inner;
    e: Inner?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            a:1,b:true,c:"hi",
            d:Inner{x:42},
            e:null
        };
    }
}