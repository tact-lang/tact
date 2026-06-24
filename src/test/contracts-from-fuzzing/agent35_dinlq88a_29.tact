struct Sub {
    s: String?;
    n: Int?;
}

struct Wrap {
    sub1: Sub?;
    sub2: Sub?;
}

contract TestContract {
    wrap: Wrap = Wrap{ sub1: null, sub2: null };
}