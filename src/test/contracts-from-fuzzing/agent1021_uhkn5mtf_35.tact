// multiple optional nested layers with serialization
struct X {
    a: Int as uint32;
    b: Bool?;
}

struct Y {
    x: X?;
}

struct Z {
    y: Y?;
}

contract OptNestSerial {
    z: Z = Z{ y: null };
}