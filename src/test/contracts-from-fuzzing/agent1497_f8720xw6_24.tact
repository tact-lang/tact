struct Inner {
    first: Int;
    second: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract TestContract {
    composed: Outer = Outer{
        a: Inner{ first:1, second:true },
        b: Inner{ first:2, second:false },
        c: Inner{ first:3, second:true }
    };
}