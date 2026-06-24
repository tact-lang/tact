struct STest {
    a: Int;
    b: Bool?;
}

contract ListOfStructs {
    s1: STest;
    s2: STest;
    s3: STest;

    init() {
        self.s1 = STest{ a: 1, b: null };
        self.s2 = STest{ a: 2, b: true };
        self.s3 = STest{ a: 3, b: null };
    }
}