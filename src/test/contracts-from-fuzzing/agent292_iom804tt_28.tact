struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract TwoInnerStructs {
    o: Outer;

    init() {
        self.o = Outer{
            first: Inner{ a:1, b:true, c:"x" },
            second: Inner{ a:2, b:false, c:"y" }
        };
    }
}