struct Bottom { v: Int; }

struct Middle {
    m: Bottom? = Bottom{ v: 123 };
}

struct Top {
    t: Middle;
}

contract TestContract(param: Top) {}
