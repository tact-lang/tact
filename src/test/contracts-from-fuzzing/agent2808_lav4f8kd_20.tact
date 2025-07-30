struct Inner {
    p: Int;
    q: Bool;
}

contract Test {
    a: Inner = Inner{p:1,q:true};
    b: Inner = Inner{p:2,q:false};
    c: Inner = Inner{p:3,q:true};
    d: Inner = Inner{p:4,q:false};
    init() {}
}