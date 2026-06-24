struct Deep {
    a: Int = 5;
    b: Bool? = null;
}

struct Outer {
    inner: Deep? = null;
    flag: Bool = false;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}