struct A1 { a: Int; }
struct A2 { a: Int; }
struct A3 { a: Int; }

struct Blob {
    f1: A1;
    f2: Int;
    f3: Bool;
    f4: A2;
    f5: A3;
}

contract MixedComplex {
    blob: Blob;
    init() {
        self.blob = Blob{
            f1: A1{a:1},
            f2: 2,
            f3: true,
            f4: A2{a:4},
            f5: A3{a:5}
        };
    }
}