struct Inner {
    x: Int;
    y: Int;
}

contract Defaults {
    p: Inner = Inner{x:42,y:24};
    q: Int = 10;
    r: Bool = true;
    s: String = "hi";
    init() {}
}