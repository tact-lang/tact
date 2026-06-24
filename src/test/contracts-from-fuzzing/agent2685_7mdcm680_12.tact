struct Compose {
    a: Inner?
}

struct Inner {
    x: Int;
}

contract K {
    c: Compose = Compose { a: null };
}
