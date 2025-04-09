struct Rec1 {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Rec2 {
    s1: Rec1;
    f4: Int;
    s2: Rec1;
}

contract TestContract {
    nested: Rec2;
    init() {
        self.nested = Rec2{
            s1: Rec1{ f1: 1, f2: true, f3: "hi" },
            f4: 42,
            s2: Rec1{ f1: 2, f2: false, f3: "yo" }
        };
    }
}