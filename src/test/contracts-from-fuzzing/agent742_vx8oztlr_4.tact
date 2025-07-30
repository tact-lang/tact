struct Inner {
    x: Int;
    y: Bool;
    u: Int?;
    s: String;
}

contract TestContract {
    inner: Inner = Inner{x:1, y:true, u:null, s:"hello"};
    init() {}
}