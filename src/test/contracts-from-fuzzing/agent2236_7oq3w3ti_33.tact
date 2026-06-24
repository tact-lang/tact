struct Struct1 { a: Int }
struct Struct2 { b: Bool }
struct Struct3 { s: String }

contract MixedStructs {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
    optS1: Struct1?;

    init() {
        self.s1 = Struct1{ a: 1 };
        self.s2 = Struct2{ b: true };
        self.s3 = Struct3{ s: "str" };
        self.optS1 = null;
    }
}