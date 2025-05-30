struct Inner {
    c: Int;
    d: Bool;
}

struct Outer {
    x: Int?;
    y: Inner;
}

contract NestedStructContract {
    data: Outer = Outer{x:null, y:Inner{c:1, d:true}};
}