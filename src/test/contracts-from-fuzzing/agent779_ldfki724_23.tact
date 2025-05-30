struct Struct1 { val1: Int; }
struct Struct2 { val2: String; }
struct Struct3 { val3: Bool; }

contract ManyStructTypes {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;

    init() {
        self.s1 = Struct1{ val1: 10 };
        self.s2 = Struct2{ val2: "hi" };
        self.s3 = Struct3{ val3: true };
    }
}