struct FooBar {
    x: Int?; // optional no default
    y: Int; // no default
}

contract FooBarContract {
    fb: FooBar = FooBar{ y: 42 };
}