struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Outer {
    x: Inner;
    y: Inner?;
}

contract CrossOptional {
    data: Outer = Outer{x: Inner{a:0,b:false,c:null}, y: null};
}