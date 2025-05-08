struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: Int?; }

struct BigNested {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    flag: Bool;
    s: String;
}

contract ComplexNestedStruct {
    b: BigNested;

    init() {
        self.b = BigNested{
            i1: Inner1{ a: 42 },
            i2: Inner2{ b: false },
            i3: Inner3{ c: null },
            flag: true,
            s: "abc"
        };
    }
}