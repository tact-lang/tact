struct Inner {
    val: Int;
}

struct Middle {
    inn: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    data: Outer = Outer{
        mid: null,
    };

    init() {}
}