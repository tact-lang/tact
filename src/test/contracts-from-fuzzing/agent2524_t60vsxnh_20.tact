const DEFNUM: Int = 7;

struct Consted {
    foo: Int = DEFNUM;
    bar: Bool = true;
}

contract ConstInit {
    stuff: Consted = Consted{};
}