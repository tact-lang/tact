struct Wrapper {
    f: Inner?;
}

struct Inner {
    x: Int?;
}

contract DoubleOptField {
    w: Wrapper = Wrapper{ f: null };
}