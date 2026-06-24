struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: Nested = Nested{inner: Inner{x: 7, y: false}, flag: true};
}