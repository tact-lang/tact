struct Simple {
    a: Int;
    b: Bool;
}

contract ClassicLazy {
    several: Simple = Simple{ a: 123, b: false };
}
