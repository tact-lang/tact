struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String?;
}

contract TestContract {
    st: Outer = Outer{x:42, y:Inner{a:1, b:true}, z:null};
    init() {}
}