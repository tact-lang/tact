struct Mid1 { a: Int; }
struct Mid2 { b: Int; }
struct Mid3 { c: Int; }

struct Layer1 {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
}

contract StorageTest {
    data: Layer1;

    init() {
        self.data = Layer1{
            m1: Mid1{ a: 1 },
            m2: Mid2{ b: 2 },
            m3: Mid3{ c: 3 }
        };
    }
}