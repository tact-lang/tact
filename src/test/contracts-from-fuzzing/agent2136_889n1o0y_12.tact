struct Alpha {
    x: Int;
}

struct Beta {
    y: Bool;
}

contract TestContract {
    a: Alpha = Alpha{x:1};
    b: Beta = Beta{y:true};

    init() {}
}