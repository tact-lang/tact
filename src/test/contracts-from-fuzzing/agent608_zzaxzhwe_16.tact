struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    foo: Inner = Inner{x:123, y:null};
    bar: Inner = Inner{x:234, y:345};
}
