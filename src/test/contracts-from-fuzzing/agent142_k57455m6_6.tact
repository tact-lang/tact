struct Inner {
    flag: Bool;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    deepOpt: Outer = Outer{
        mid: Middle{
            inner: null,
        },
    };

    init() {}

    receive() {}
}