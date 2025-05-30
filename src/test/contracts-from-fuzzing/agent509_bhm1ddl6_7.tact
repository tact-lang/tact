struct Struct1 { a: Int; }
struct Struct2 { b: Bool; }
struct Struct3 { s2: Struct2; c: String; }

contract MultiNested {
    s1: Struct1;
    s3: Struct3;

    init() {
        self.s1 = Struct1{ a: 123 };
        self.s3 = Struct3{ s2: Struct2{ b: false }, c: "data" };
    }
}