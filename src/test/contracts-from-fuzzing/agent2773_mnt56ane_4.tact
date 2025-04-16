struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner?;
}

contract TestContract {
    nested: Outer = Outer{
        bar: Inner{foo: 7}
    };
}