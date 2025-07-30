struct Midchain {
    x: Int;
    s: S2;
}

struct S2 {
    y: Int;
    s: S3;
}

struct S3 {
    z: Int?;
}

contract ChainMid {
    m: Midchain = Midchain{
        x: 1,
        s: S2{
            y: 2,
            s: S3{ z: null }
        }
    };
}
