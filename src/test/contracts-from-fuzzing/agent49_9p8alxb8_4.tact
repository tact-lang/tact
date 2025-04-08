struct Inner {
    items: map<Int, Int>;
}

struct Outer {
    inner: Inner;
}

contract Test {
    field1: Outer?;
}
