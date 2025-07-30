struct Inner {
    a: Int = 1;
    b: Bool?;
}

struct Middle {
    c: String = "x";
    d: Inner;
    e: Inner?;
}

contract TestContract {
    nested: Middle = Middle{
        d: Inner{},
        e: null
    };
}