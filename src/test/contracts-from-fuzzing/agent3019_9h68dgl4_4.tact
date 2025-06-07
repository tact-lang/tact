struct DeepInner {
    a: Int = 7;
}

struct Middle {
    inner: DeepInner;
    b: Int = 8;
}

contract TestContract {
    middle: Middle = Middle{inner: DeepInner{}};
    flag: Bool = true;
    count: Int = 5;
}