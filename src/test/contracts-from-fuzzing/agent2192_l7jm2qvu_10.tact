struct Inner {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    val: Inner;
}

contract Filled {
    data: Outer = Outer{ val: Inner{} };
}