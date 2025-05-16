struct Struct1 {
    a: Int;
}

struct Struct2 {
    b: Int;
    c: Bool;
}

struct Struct3 {
    d: String;
    e: Bool?;
}

contract ManyStructs {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;

    init() {
        self.s1 = Struct1{a: 1};
        self.s2 = Struct2{b: 2, c: true};
        self.s3 = Struct3{d: "hi", e: null};
    }
}