struct Inner {
    flag: Bool?;
    comment: String?;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    outer: Outer = Outer{
        nested: Inner{},
    };
}