struct Inner {
    x: Int;
    y: Bool;
}

contract ArrayLikeFields {
    f1: Inner = Inner{x:1,y:true};
    f2: Inner = Inner{x:2,y:false};
    f3: Inner = Inner{x:3,y:true};

    init() {}
}