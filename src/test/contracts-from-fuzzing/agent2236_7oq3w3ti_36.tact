struct S1 { a: Int as int64 }
struct S2 { b: Int as int8 }

contract SerializationNested {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ a: 50 };
        self.s2 = S2{ b: 5 };
    }
}