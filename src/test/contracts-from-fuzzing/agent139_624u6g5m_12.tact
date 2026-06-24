struct Inner1 { a: Int }
struct Inner2 { b: String }
struct Inner3 { c: Bool }

struct Combo {
    f1: Inner1; f2: Inner2; f3: Inner3;
}

contract ManyNestedStructs {
    c: Combo;

    init() {
        self.c = Combo{
            f1: Inner1{ a: 1 },
            f2: Inner2{ b: "hi" },
            f3: Inner3{ c: true }
        };
    }
}