struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    x: Bool;
    y: Int?;
}

contract MultipleStructs {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{a: 5, b: "hi"};
        self.f2 = S2{x: true, y: null};
    }
}