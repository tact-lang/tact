struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
}

struct StructC {
    c: String;
}

contract ManyStructFields {
    s1: StructA = StructA{ a: 1 };
    s2: StructB = StructB{ b: true };
    s3: StructC = StructC{ c: "x" };

    receive() {}
}