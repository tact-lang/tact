struct DeepInner {
    a: Int = 7;
    opt: Int?; // optional unset, defaults null
}

struct Middle {
    inner: DeepInner;
    c: Bool = false;
}

contract TestContract {
    middle: Middle = Middle{inner: DeepInner{}};
    amount: Int = 100;
}