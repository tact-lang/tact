struct S1 {
    i: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    val: Bool;
}

contract SameStructs {
    f: S2 = S2{
        s1a: S1{ i: 1 },
        s1b: S1{ i: 2 },
        val: true
    };

    receive() {
        self.f = self.f;
    }
}