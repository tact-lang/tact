struct A {
    intVal: Int = 7;
    boolVal: Bool = false;
    s1: S1 = S1{ v: 3 };
    optS2: S2?;
}

struct S1 {
    v: Int;
}

struct S2 {
    f: Bool;
}

contract OptStructFieldsTest {
    store: A = A{};

    init() {
        self.store = A{
            intVal: 42,
            boolVal: true,
            s1: S1{ v: 9 },
            optS2: S2{ f: true }
        };
    }
}