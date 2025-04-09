struct Mid1 {
    a: Int;
}

struct Mid2 {
    b: Int;
}

struct Mid3 {
    c: Int;
}

struct TopComb {
    x: Mid1;
    y: Mid2;
    z: Mid3;
}

contract MultiMid {
    top: TopComb;

    init() {
        self.top = TopComb{
            x: Mid1{a:1}, y: Mid2{b:2}, z: Mid3{c:3}
        };
    }
}