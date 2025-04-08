struct S1 {
    x: Int;
    y: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract RepeatedStructs {
    data: S2;

    init() {
        self.data = S2{
            s1a: S1{ x: 1, y: 2 },
            s1b: S1{ x: 3, y: 4 }
        };
    }
}