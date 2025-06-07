struct Inner {
    num: Int = 5;
    flag: Bool? = null;
}

struct Outer {
    i1: Inner;
    i2: Inner?;
}

contract TestContract {
    data: Outer = Outer{ i2: null, i1: Inner{} };

    receive() {}
}