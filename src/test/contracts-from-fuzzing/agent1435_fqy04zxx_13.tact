struct S1 { x: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }

struct Pair {
    left: S3; 
    right: S3;
}

contract DoubleNested {
    pair: Pair;

    init() {
        self.pair = Pair{
            left: S3{ s2: S2{ s1: S1{ x: 5 } } },
            right: S3{ s2: S2{ s1: S1{ x: 10 } } }
        };
    }
}