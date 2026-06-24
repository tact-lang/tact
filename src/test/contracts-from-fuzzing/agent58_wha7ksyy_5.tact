struct S {
    a: Int;
    b: Bool;
}

contract ArrayOfStructs {
    s1: S = S{a: 1, b: true};
    s2: S = S{a: 2, b: false};
    s3: S = S{a: 3, b: true};
    s4: S = S{a: 4, b: false};

    receive() {
        let _ = self.s1.a + self.s2.a + self.s3.a + self.s4.a;
    }
}