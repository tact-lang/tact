struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    s: S1;
    b: Bool;
}

contract StorageTest {
    data: S2;

    init() {
        self.data = S2{
            s: S1{a: 1, b: "x"},
            b: true
        };
    }
}