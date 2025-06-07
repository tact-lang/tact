struct InnerChild {
    a: Int;
    b: Bool;
}

struct Outer {
    first: InnerChild;
    second: InnerChild;
}

contract SameStructMultipleTimes {
    s: Outer;

    init() {
        self.s = Outer{
            first: InnerChild{ a:1, b:true },
            second: InnerChild{ a:2, b:false }
        };
    }
}