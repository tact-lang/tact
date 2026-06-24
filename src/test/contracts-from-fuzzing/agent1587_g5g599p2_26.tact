struct Struct1 { val1: Int; }
struct Struct2 { val2: Int; }
struct Struct3 { val3: Int; }

contract ThreeFields {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;

    init() {
        self.s1 = Struct1{ val1: 1 };
        self.s2 = Struct2{ val2: 2 };
        self.s3 = Struct3{ val3: 3 };
    }
}