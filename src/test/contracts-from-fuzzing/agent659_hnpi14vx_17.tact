struct Innermost {
    foo: Int = 99;
}

struct Inner {
    innerSub: Innermost = Innermost{};
    flag: Bool = true;
}

struct Outer {
    sub: Inner = Inner{};
    val: Int = 100;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}