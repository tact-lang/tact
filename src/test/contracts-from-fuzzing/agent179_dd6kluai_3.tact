struct Sub {
    s: String? = null;
}

struct Outer {
    inner: Sub = Sub{};
}

contract TestContract {
    data: Outer = Outer{};
}