struct Inner {
    b: Bool = true;
    s: String?;
}

struct Outer {
    inner: Inner?;
    flag: Bool = false;
}

contract TestContract {
    o: Outer = Outer{ inner: null, flag: true };
}